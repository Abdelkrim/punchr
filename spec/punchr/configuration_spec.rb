require 'spec_helper'

describe Punchr::Configuration do
  describe '#configure' do
    it 'should allow you to configure punchr' do
      Punchr.configure do |configuration|
        configuration.api_key = 'punchr-api-key'
      end

      Punchr.api_key.should == 'punchr-api-key'
    end
  end
end