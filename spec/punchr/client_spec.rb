require 'spec_helper'
require 'punchr/client'

describe 'Punchr::Client' do
  before(:each) do
    Punchr.configure do |configuration|
      configuration.api_key = 'this-is-your-api-key'
    end
  end

  describe '#recipes' do
    it 'should allow you to search for recipes' do
      VCR.use_cassette('recipes', :record => :once) do
        client = Punchr::Client.new
        response = client.recipes(:q => 'meatballs')
        response['count'].should == 10
      end
    end
  end

  describe '#random_recipe' do
    it 'should allow you to retrieve a random recipe' do
      VCR.use_cassette('random_recipe', :record => :once) do
        client = Punchr::Client.new
        response = client.random_recipe
        response['recipe']['rating'].should == 3.7474
      end
    end
  end

  describe '#publishers' do
    it 'should allow you to retrieve a list of publishers' do
      VCR.use_cassette('publishers', :record => :once) do
        client = Punchr::Client.new
        response = client.publishers
        response['publishers'].size.should == 85
      end
    end
  end

  describe '#diet_index' do
    it 'should allow you to generate a list of diet terms describing which diets are safe for the input recipe ingredients' do
      VCR.use_cassette('diet_index', :record => :once) do
        client = Punchr::Client.new
        response = client.diet_index('2 cups yellow cornmeal\n2 teaspoons baking powder\n3/4 to 1 teaspoon fine sea salt\n1 large egg, lightly beaten\n1 cup water, plus more if needed\n1/4 to 1/3 cup mild-flavored vegetable oil for frying')
        response['diets'].size.should == 2
      end
    end
  end

  describe '#search_index' do
    it 'should allow you to generate a list of search index terms for a recipe' do
      VCR.use_cassette('search_index', :record => :once) do
        client = Punchr::Client.new
        response = client.search_index('Chicken Parmigiana', '1 egg, beaten\n2 ounces dry bread crumbs\n2 skinless, boneless chicken breast halves\n3/4 (16 ounce) jar spaghetti sauce\n2 ounces shredded mozzarella cheese\n1/4 cup grated Parmesan cheese')
        response['terms'].size.should == 15
      end
    end
  end

  describe '#rate_limit_status' do
    it 'should allow you to retrieve your rate limit status' do
      VCR.use_cassette('rate_limit_status', :record => :once) do
        client = Punchr::Client.new
        response = client.rate_limit_status
        response['remaining_calls'].should == 250
      end
    end
  end
end