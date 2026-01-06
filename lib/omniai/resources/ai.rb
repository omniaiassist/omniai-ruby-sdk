module OmniAI
  module Resources
    # AI-powered features
    class AI
      def initialize(client)
        @client = client
      end

      # Get AI chat completion
      #
      # @example
      #   response = client.ai.chat_completion(
      #     messages: [
      #       { role: 'user', content: 'Preciso de ajuda com meu pedido' }
      #     ]
      #   )
      def chat_completion(params)
        @client.post('/ai/chat', body: params)
      end

      # Analyze text sentiment
      #
      # @example
      #   sentiment = client.ai.analyze_sentiment(
      #     text: 'Estou muito satisfeito com o atendimento!'
      #   )
      #   puts sentiment['sentiment'] # 'positive'
      def analyze_sentiment(params)
        @client.post('/ai/sentiment', body: params)
      end

      # Extract user intent from text
      #
      # @example
      #   intent = client.ai.extract_intent(
      #     text: 'Quero cancelar minha assinatura'
      #   )
      #   puts intent['intent'] # 'cancel_subscription'
      def extract_intent(params)
        @client.post('/ai/intent', body: params)
      end

      # Generate AI response suggestion
      #
      # @example
      #   suggestion = client.ai.generate_response(
      #     context: 'Cliente perguntou sobre prazo de entrega',
      #     user_message: 'Quando chega meu pedido?',
      #     tone: 'professional'
      #   )
      def generate_response(params)
        @client.post('/ai/generate-response', body: params)
      end
    end
  end
end
