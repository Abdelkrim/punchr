module Punchr
  # Configuration settings for Punchr.
  module Configuration
    # API key.
    attr_accessor :api_key

    # Yield self to be able to configure Punchr with block-style configuration.
    #
    # Example:
    #
    #   Punchr.configure do |configuration|
    #     configuration.api_key = 'your-punchr-api-key'
    #   end
    def configure
      yield self
    end
  end
end