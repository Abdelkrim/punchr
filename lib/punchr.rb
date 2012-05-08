require 'punchr/version'
require 'punchr/configuration'
require 'punchr/client'

module Punchr
  extend Configuration

  API_URL = 'https://api.punchfork.com'
  USER_AGENT_HEADER = "punchr gem version #{Punchr::VERSION}"
end
