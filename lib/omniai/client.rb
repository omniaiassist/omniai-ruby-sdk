require 'faraday'
require 'json'

module OmniAI
  # OmniAI API Client
  #
  # @example
  #   client = OmniAI::Client.new('YOUR_API_KEY')
  #
  #   message = client.messages.send(
  #     phone: '+5511999999999',
  #     channel: 'whatsapp',
  #     type: 'text',
  #     content: 'Olá! Como posso ajudar?'
  #   )
  class Client
    attr_reader :api_key, :base_url, :messages, :contacts, :campaigns, :analytics, :ai

    def initialize(api_key, base_url: 'http://localhost:3000/api/v1')
      raise ArgumentError, 'API key is required' if api_key.nil? || api_key.empty?

      @api_key = api_key
      @base_url = base_url.chomp('/')
      @connection = build_connection

      # Initialize resource managers
      @messages = Resources::Messages.new(self)
      @contacts = Resources::Contacts.new(self)
      @campaigns = Resources::Campaigns.new(self)
      @analytics = Resources::Analytics.new(self)
      @ai = Resources::AI.new(self)
    end

    # Make HTTP request to API
    # @api private
    def request(method, endpoint, params: nil, body: nil)
      response = @connection.send(method) do |req|
        req.url endpoint
        req.params = params if params
        req.body = body.to_json if body
      end

      handle_response(response)
    rescue Faraday::Error => e
      raise OmniAIError, "Request failed: #{e.message}"
    end

    def get(endpoint, params: nil)
      request(:get, endpoint, params: params)
    end

    def post(endpoint, body: nil)
      request(:post, endpoint, body: body)
    end

    def put(endpoint, body: nil)
      request(:put, endpoint, body: body)
    end

    def delete(endpoint)
      request(:delete, endpoint)
    end

    private

    def build_connection
      Faraday.new(url: @base_url) do |conn|
        conn.request :json
        conn.response :json
        conn.headers['Authorization'] = "Bearer #{@api_key}"
        conn.headers['User-Agent'] = "OmniAI-Ruby/#{OmniAI::VERSION}"
        conn.adapter Faraday.default_adapter
      end
    end

    def handle_response(response)
      case response.status
      when 200..299
        response.body
      when 401
        raise AuthenticationError, 'Invalid API key'
      when 400
        message = response.body.is_a?(Hash) ? response.body['message'] : 'Validation error'
        raise ValidationError, message
      when 429
        raise RateLimitError, 'Rate limit exceeded'
      else
        message = response.body.is_a?(Hash) ? response.body['message'] : response.reason_phrase
        raise OmniAIError, "API error: #{response.status} - #{message}"
      end
    end
  end
end
