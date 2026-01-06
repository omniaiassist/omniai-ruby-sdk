module OmniAI
  class OmniAIError < StandardError; end
  class AuthenticationError < OmniAIError; end
  class ValidationError < OmniAIError; end
  class RateLimitError < OmniAIError; end
end
