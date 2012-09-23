require 'spec_helper'

describe 'Punchr::VERSION' do
  it 'should be the correct version' do
    Punchr::VERSION.should == '1.0.0'
  end
end