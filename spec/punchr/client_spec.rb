require 'spec_helper'
require 'weary/middleware'
require 'weary/middleware/content_type'

describe 'Punchr::Client' do
  before(:each) do
    Punchr.configure do |configuration|
      configuration.api_key = 'this-is-your-punchfork-api-key'
    end

    require 'punchr/client'
  end

  describe '#recipes' do
    it 'should allow you to search for recipes' do
      VCR.use_cassette('recipes', :record => :once) do
        client = Punchr::Client.new
        response = client.recipes(:q => 'meatballs').perform
        response.parse['count'].should == 10
      end
    end
  end

  describe '#random_recipe' do
    it 'should allow you to retrieve a random recipe' do
      VCR.use_cassette('random_recipe', :record => :once) do
        client = Punchr::Client.new
        response = client.random_recipe.perform
        response.parse['recipe'].should_not be_nil
        response.parse['recipe']['rating'].should == 21.7069
      end
    end
  end

  describe '#publishers' do
    it 'should allow you to retrieve a list of publishers' do
      VCR.use_cassette('publishers', :record => :once) do
        client = Punchr::Client.new
        response = client.publishers.perform
        response.parse['publishers'].should_not be_nil
        response.parse['publishers'].size.should == 78
      end
    end
  end

  describe '#search_index' do
    it 'should allow you to generate a list of search index terms for a recipe' do
      VCR.use_cassette('search_index', :record => :once) do
        client = Punchr::Client.new
        response = client.search_index(:title => 'Chicken Parmigiana', :ingred => '1 egg, beaten\n2 ounces dry bread crumbs\n2 skinless, boneless chicken breast halves\n3/4 (16 ounce) jar spaghetti sauce\n2 ounces shredded mozzarella cheese\n1/4 cup grated Parmesan cheese').perform
        response.parse['terms'].size.should == 15
      end
    end
  end

  describe '#rate_limit_status' do
    it 'should allow you to retrieve your rate limit status' do
      VCR.use_cassette('rate_limit_status', :record => :once) do
        client = Punchr::Client.new
        response = client.rate_limit_status.perform
        response.parse['remaining_calls'].should == 250
      end
    end
  end
end