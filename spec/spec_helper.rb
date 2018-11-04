require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'pry'
require 'dotenv'
Dotenv.load

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
  end
end
