require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'shields_badge'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::ShieldsBadge,
  SimpleCov::Formatter::Console,
]
