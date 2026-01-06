module OmniAI
  module Resources
    # Manage messages
    class Messages
      def initialize(client)
        @client = client
      end

      # Send a message
      #
      # @param params [Hash] Message parameters
      # @return [Hash] Message object
      #
      # @example
      #   message = client.messages.send(
      #     phone: '+5511999999999',
      #     channel: 'whatsapp',
      #     type: 'text',
      #     content: 'Olá! Como posso ajudar?'
      #   )
      def send(params)
        @client.post('/messages', body: params)
      end

      # Get message by ID
      def get(message_id)
        @client.get("/messages/#{message_id}")
      end

      # List messages
      def list(params = {})
        @client.get('/messages', params: params)
      end

      # Send multiple messages
      #
      # @example
      #   result = client.messages.send_bulk(
      #     messages: [
      #       {
      #         phone: '+5511999999999',
      #         channel: 'whatsapp',
      #         type: 'text',
      #         content: 'Message 1'
      #       },
      #       {
      #         phone: '+5511888888888',
      #         channel: 'whatsapp',
      #         type: 'text',
      #         content: 'Message 2'
      #       }
      #     ]
      #   )
      def send_bulk(params)
        @client.post('/messages/bulk', body: params)
      end
    end
  end
end
