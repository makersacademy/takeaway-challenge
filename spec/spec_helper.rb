require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../lib/menu'
require_relative '../lib/dish'
require_relative '../lib/order'
require_relative '../lib/message'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
