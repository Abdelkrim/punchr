require 'rspec'
require 'weary'
require 'punchr'
require 'vcr'
require 'fakeweb'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

FakeWeb.allow_net_connect = false

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.allow_http_connections_when_no_cassette = false
end

RSpec.configure do |config|
end