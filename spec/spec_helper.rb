require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'menu'
require 'dish'
require 'order'
require 'messenger'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
