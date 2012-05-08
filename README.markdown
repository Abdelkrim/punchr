# punchr

Ruby gem for interacting with the [Punchfork API](http://punchfork.com/api).

## Installation

`gem install punchr`

or in your `Gemfile`

```ruby
gem 'punchr'
```
  
## Usage

Configure punchr with your API key:

```ruby
require 'punchr'

Punchr.api_key = 'this-is-your-punchfork-api-key'
```

or configure as:

```ruby
Punchr.configure do |configuration|
  configuration.api_key = 'your-punchr-api-key'
end
```

```
client = Punchr::Client.new

response = client.recipes(:q => 'meatballs')

response = client.random_recipe

response = client.publishers

response = client.diet_index('2 cups yellow cornmeal\n2 teaspoons baking powder\n3/4 to 1 teaspoon fine sea salt\n1 large egg, lightly beaten\n1 cup water, plus more if needed\n1/4 to 1/3 cup mild-flavored vegetable oil for frying') # Premium API call

response = client.search_index(:title => 'Chicken Parmigiana', :ingred => '1 egg, beaten\n2 ounces dry bread crumbs\n2 skinless, boneless chicken breast halves\n3/4 (16 ounce) jar spaghetti sauce\n2 ounces shredded mozzarella cheese\n1/4 cup grated Parmesan cheese') # Ultra API call

response = client.rate_limit_status
```

You can find more details on the [Punchfork API](http://punchfork.com/api#apidocs) at their site.
  
## Contributing to punchr
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 David Czarnecki. See LICENSE.txt for further details.
