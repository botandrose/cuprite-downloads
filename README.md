# Cuprite::Downloads

A file download API for Cuprite

## Installation

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem 'cuprite-downloads'
```

```ruby
# features/support/env.rb
require "capybara/cuprite"
require "cuprite/downloads/cucumber"
```

_TODO: other test runner integration_

This gem adds a `page.driver.downloads` method, which returns an instance of `Capybara::Cuprite::Downloads`. This object has a few useful methods:

* `#filenames`: an array of all the downloaded filenames
* `#[](filename)`: an open File handle to the specified filename

These methods also exist, but are mostly only useful in hooking it up to Capybara and your test runner, which is taken care of in the `cuprite/downloads/cucumber` file

* `#pathname`: The directory where the downloads are saved, usualy something like `tmp/capybara/1640698858474/downloads`. The number is a unique key to ensure concurrent file downloads don't collide.
* `#reset`: Empties the directory above. This is automatically called after each cucumber scenario

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cuprite-downloads.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
