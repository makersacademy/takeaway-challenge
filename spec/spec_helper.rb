require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'capybara/rspec'
require 'pry'
require 'rack/test'
