require_relative "omniai/version"
require_relative "omniai/client"
require_relative "omniai/errors"
require_relative "omniai/resources/messages"
require_relative "omniai/resources/contacts"
require_relative "omniai/resources/campaigns"
require_relative "omniai/resources/analytics"
require_relative "omniai/resources/ai"

module OmniAI
  class Error < StandardError; end
end
