module OmniAI
  module Resources
    # Manage marketing campaigns
    class Campaigns
      def initialize(client)
        @client = client
      end

      # Create a new campaign
      def create(params)
        @client.post('/campaigns', body: params)
      end

      # Get campaign by ID
      def get(campaign_id)
        @client.get("/campaigns/#{campaign_id}")
      end

      # List campaigns
      def list(params = {})
        @client.get('/campaigns', params: params)
      end

      # Start campaign
      def start(campaign_id)
        @client.post("/campaigns/#{campaign_id}/start")
      end

      # Pause campaign
      def pause(campaign_id)
        @client.post("/campaigns/#{campaign_id}/pause")
      end

      # Delete campaign
      def delete(campaign_id)
        @client.delete("/campaigns/#{campaign_id}")
      end
    end
  end
end
