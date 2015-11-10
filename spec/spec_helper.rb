require 'bundler/setup'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require 'tvml'

RSpec.configure do |config|
  config.before(:each) { stub_const 'TVML::BUILDER_OPTIONS', {} }
end
