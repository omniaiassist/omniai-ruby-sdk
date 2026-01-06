# OmniAI Ruby SDK

Official Ruby SDK for the OmniAI API - Multi-channel messaging platform with AI automation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniai-sdk'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install omniai-sdk
```

## Requirements

- Ruby >= 2.6.0
- faraday >= 2.0

## Quick Start

```ruby
require 'omniai-sdk'

# Initialize client
client = OmniAI::Client.new('YOUR_API_KEY')

# Send a message
message = client.messages.send(
  phone: '+5511999999999',
  channel: 'whatsapp',
  type: 'text',
  content: 'Olá! Como posso ajudar?'
)

puts "Message sent: #{message['id']}"
```

## Features

- **Multi-channel messaging** - WhatsApp, Email, SMS, Telegram
- **Contact management** - Create, update, search contacts
- **Campaign automation** - Schedule and manage marketing campaigns
- **AI-powered features** - Chat completions, sentiment analysis, intent detection
- **Analytics & Reports** - Get insights and export reports
- **Error handling** - Comprehensive exception classes
- **Modern Ruby** - Clean, idiomatic Ruby code

## Usage Examples

### Send Messages

```ruby
# Text message
message = client.messages.send(
  phone: '+5511999999999',
  channel: 'whatsapp',
  type: 'text',
  content: 'Hello from OmniAI!'
)

# Media message
media_message = client.messages.send(
  phone: '+5511999999999',
  channel: 'whatsapp',
  type: 'image',
  content: 'Check this image',
  media_url: 'https://example.com/image.jpg'
)

# Bulk send
result = client.messages.send_bulk(
  messages: [
    {
      phone: '+5511999999999',
      channel: 'whatsapp',
      type: 'text',
      content: 'Message 1'
    },
    {
      phone: '+5511888888888',
      channel: 'whatsapp',
      type: 'text',
      content: 'Message 2'
    }
  ]
)
```

### Manage Contacts

```ruby
# Create contact
contact = client.contacts.create(
  name: 'João Silva',
  phone: '+5511999999999',
  email: 'joao@example.com',
  tags: ['customer', 'vip']
)

# List contacts
contacts = client.contacts.list(
  page: 1,
  limit: 50,
  search: 'João'
)

# Update contact
updated = client.contacts.update(
  'contact-123',
  tags: ['customer', 'vip', 'premium']
)
```

### Create Campaigns

```ruby
campaign = client.campaigns.create(
  name: 'Black Friday 2024',
  channel: 'whatsapp',
  message_template: 'Aproveite 50% OFF em todos os produtos!',
  target_audience: {
    tags: ['customer'],
    segment: 'active'
  },
  scheduled_at: '2024-11-29T09:00:00Z'
)

# Start campaign
client.campaigns.start(campaign['id'])
```

### AI Features

```ruby
# Chat completion
response = client.ai.chat_completion(
  messages: [
    { role: 'user', content: 'Preciso de ajuda com meu pedido' }
  ]
)

# Sentiment analysis
sentiment = client.ai.analyze_sentiment(
  text: 'Estou muito satisfeito com o atendimento!'
)
puts sentiment['sentiment'] # 'positive'

# Intent detection
intent = client.ai.extract_intent(
  text: 'Quero cancelar minha assinatura'
)
puts intent['intent'] # 'cancel_subscription'

# Generate response
suggestion = client.ai.generate_response(
  context: 'Cliente perguntou sobre prazo de entrega',
  user_message: 'Quando chega meu pedido?',
  tone: 'professional'
)
```

### Analytics

```ruby
# Get overview
analytics = client.analytics.get_overview(
  start_date: '2024-01-01',
  end_date: '2024-01-31',
  channel: 'whatsapp'
)

# Export report
export = client.analytics.export_report(
  report_type: 'messages',
  start_date: '2024-01-01',
  end_date: '2024-01-31',
  format: 'pdf'
)
puts export['downloadUrl']
```

## Error Handling

```ruby
client = OmniAI::Client.new('YOUR_API_KEY')

begin
  message = client.messages.send(
    phone: '+5511999999999',
    channel: 'whatsapp',
    type: 'text',
    content: 'Hello!'
  )
rescue OmniAI::AuthenticationError
  puts 'Invalid API key'
rescue OmniAI::ValidationError => e
  puts "Validation error: #{e.message}"
rescue OmniAI::RateLimitError
  puts 'Rate limit exceeded, please wait'
rescue OmniAI::OmniAIError => e
  puts "API error: #{e.message}"
end
```

## Configuration

```ruby
# Custom configuration
client = OmniAI::Client.new(
  'YOUR_API_KEY',
  base_url: 'https://api.omniaiassist.com/v1'
)
```

## API Reference

### Messages
- `client.messages.send(params)` - Send message
- `client.messages.get(message_id)` - Get message by ID
- `client.messages.list(params)` - List messages
- `client.messages.send_bulk(params)` - Send multiple messages

### Contacts
- `client.contacts.create(params)` - Create contact
- `client.contacts.get(contact_id)` - Get contact by ID
- `client.contacts.list(params)` - List contacts
- `client.contacts.update(contact_id, params)` - Update contact
- `client.contacts.delete(contact_id)` - Delete contact

### Campaigns
- `client.campaigns.create(params)` - Create campaign
- `client.campaigns.get(campaign_id)` - Get campaign
- `client.campaigns.list(params)` - List campaigns
- `client.campaigns.start(campaign_id)` - Start campaign
- `client.campaigns.pause(campaign_id)` - Pause campaign
- `client.campaigns.delete(campaign_id)` - Delete campaign

### AI
- `client.ai.chat_completion(params)` - Chat completion
- `client.ai.analyze_sentiment(params)` - Sentiment analysis
- `client.ai.extract_intent(params)` - Intent detection
- `client.ai.generate_response(params)` - Generate response

### Analytics
- `client.analytics.get_overview(params)` - Get overview
- `client.analytics.get_messages_stats(params)` - Messages stats
- `client.analytics.get_ai_stats(params)` - AI stats
- `client.analytics.export_report(params)` - Export report

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Support

- Documentation: https://omniai.belizatech.com.br/support/documentation
- GitHub Issues: https://github.com/omniaiassist/omniai-ruby-sdk/issues
- Email: support@omniaiassist.com
