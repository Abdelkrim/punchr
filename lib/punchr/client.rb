require 'json'
require 'typhoeus'

module Punchr
  class Client
    # Recipe search. 
    # 
    # @param options [Hash] For details on valid options see http://punchfork.com/api.
    # @return Search results matching the input options.
    def recipes(options = {})
      JSON.parse(Typhoeus::Request.get(
        api_url('recipes'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => options.dup.merge({:key => Punchr.api_key})
      ).body)
    end

    # Retrieve a single recipe selected at random from the Punchfork database.
    #
    # @return A single recipe selected at random from the Punchfork database.
    def random_recipe
      JSON.parse(Typhoeus::Request.get(
        api_url('random_recipe'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => {:key => Punchr.api_key}
      ).body)
    end

    # Retrieve all recipe publishers on Punchfork.
    #
    # @return All recipe publishers on Punchfork.
    def publishers
      JSON.parse(Typhoeus::Request.get(
        api_url('publishers'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => {:key => Punchr.api_key}
      ).body)
    end

    # Generate an array of diet terms describing which diets are safe for the input recipe ingredients.
    #
    # @param ingredients [String] Recipe ingredients, as a newline-separated list. Also see http://punchfork.com/api.
    # @return An array of diet terms describing which diets are safe for the input recipe ingredients.
    def diet_index(ingredients)
      JSON.parse(Typhoeus::Request.post(
        api_url('diet_index'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => {:key => Punchr.api_key, :ingredients => ingredients}
      ).body)
    end

    # Generate search index terms for the input recipe. Also see http://punchfork.com/api.
    #
    # @param title [String] Recipe title.
    # @param ingredients [String] Recipe ingredients, as a newline-separated list. 
    # @return Search index terms for the input recipe.
    def search_index(title, ingredients)
      JSON.parse(Typhoeus::Request.post(
        api_url('search_index'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => {:key => Punchr.api_key, :title => title, :ingredients => ingredients}
      ).body)
    end

    # Retrieve the number of remaining API calls allowed today for the given API key.
    # 
    # @return The number of remaining API calls allowed today for the given API key.
    def rate_limit_status
      JSON.parse(Typhoeus::Request.get(
        api_url('rate_limit_status'),
        :headers => {'User-Agent' => Punchr::USER_AGENT_HEADER},
        :params => {:key => Punchr.api_key}
      ).body)
    end    

    private

    def api_url(api_endpoint)
      "#{Punchr::API_URL}/#{api_endpoint}"
    end    
  end
end