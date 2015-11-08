# TVML

Provides a way of working with Apple's TVML documents, templates, and elements in an elegant and friendly Ruby-style DSL.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tvml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tvml

## Usage

The TVML library is based on [Builder](https://github.com/jimweirich/builder).

```ruby
doc = TVML::Document.new
doc.template = TVML::Template::Alert.new.tap do |alert|
  alert.title = "Hello World"
  alert.description = "How are things?"
end

doc.build # => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><document><alertTemplate><description>How are things?</description><title>Hello World</title></alertTemplate></document>"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec spec/` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisb/tvml.

## Copyright

Copyright (c) 2015-2016 Chris Bielinski. See `MIT-LICENSE` for details.
