# punchr

Ruby gem for interacting with the [Punchfork API](http://punchfork.com/api).

## Installation

`gem install punchr`

or in your `Gemfile`

```ruby
gem 'punchr'
```
  
## Usage

```ruby
require 'punchr'

Punchr.api_key = 'this-is-your-punchfork-api-key'

require 'punchr/client'
client = Punchr::Client.new

response = client.recipes(:q => 'meatballs').perform
response = client.random_recipe.perform
response = client.publishers.perform
response = client.search_index(:title => 'Chicken Parmigiana', :ingred => '1 egg, beaten\n2 ounces dry bread crumbs\n2 skinless, boneless chicken breast halves\n3/4 (16 ounce) jar spaghetti sauce\n2 ounces shredded mozzarella cheese\n1/4 cup grated Parmesan cheese').perform # Paid API call
response = client.rate_limit_status.perform
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
