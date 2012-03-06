require 'weary'

module Punchr
  class Client < Weary::Client
    domain "http://api.punchfork.com"

    get :recipes, "/recipes" do |resource|
      resource.defaults :key => Punchr.api_key
      resource.optional :q, :ingred, :count, :cursor, :sort, :from, :likes, :startdate, :enddate, :total
    end

    get :random_recipe, "/random_recipe" do |resource|
      resource.defaults :key => Punchr.api_key
    end

    get :publishers, "/publishers" do |resource|
      resource.defaults :key => Punchr.api_key
    end

    post :search_index, "/search_index" do |resource|
      resource.defaults :key => Punchr.api_key
      resource.required :title, :ingred
    end

    get :rate_limit_status, "/rate_limit_status" do |resource|
      resource.defaults :key => Punchr.api_key
    end
  end 
end