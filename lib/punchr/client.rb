require 'weary'

module Punchr
  class Client < Weary::Client
    domain "http://api.punchfork.com"
    defaults :key => Punchr.api_key

    get :recipes, "/recipes" do |resource|
      resource.optional :q, :ingred, :count, :cursor, :sort, :from, :likes, :startdate, :enddate, :total
    end

    get :random_recipe, "/random_recipe" do |resource|
    end

    get :publishers, "/publishers" do |resource|
    end

    post :search_index, "/search_index" do |resource|
      resource.required :title, :ingred
    end

    get :rate_limit_status, "/rate_limit_status" do |resource|
    end
  end 
end