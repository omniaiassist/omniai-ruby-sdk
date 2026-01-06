module OmniAI
  module Resources
    # Access analytics and reports
    class Analytics
      def initialize(client)
        @client = client
      end

      # Get analytics overview
      #
      # @example
      #   analytics = client.analytics.get_overview(
      #     start_date: '2024-01-01',
      #     end_date: '2024-01-31',
      #     channel: 'whatsapp'
      #   )
      def get_overview(params)
        @client.get('/analytics/overview', params: params)
      end

      # Get messages statistics
      def get_messages_stats(params)
        @client.get('/analytics/messages', params: params)
      end

      # Get AI usage statistics
      def get_ai_stats(params)
        @client.get('/analytics/ai', params: params)
      end

      # Export analytics report
      #
      # @example
      #   export = client.analytics.export_report(
      #     report_type: 'messages',
      #     start_date: '2024-01-01',
      #     end_date: '2024-01-31',
      #     format: 'pdf'
      #   )
      #   puts export['downloadUrl']
      def export_report(params)
        @client.post('/analytics/export', body: params)
      end
    end
  end
end
