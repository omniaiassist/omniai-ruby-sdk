module OmniAI
  module Resources
    # Manage contacts
    class Contacts
      def initialize(client)
        @client = client
      end

      # Create a new contact
      def create(params)
        @client.post('/contacts', body: params)
      end

      # Get contact by ID
      def get(contact_id)
        @client.get("/contacts/#{contact_id}")
      end

      # List contacts
      def list(params = {})
        params[:tags] = params[:tags].join(',') if params[:tags].is_a?(Array)
        @client.get('/contacts', params: params)
      end

      # Update contact
      def update(contact_id, params)
        @client.put("/contacts/#{contact_id}", body: params)
      end

      # Delete contact
      def delete(contact_id)
        @client.delete("/contacts/#{contact_id}")
      end
    end
  end
end
