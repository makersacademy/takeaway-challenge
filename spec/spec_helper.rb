require 'simplecov'
SimpleCov.start

require_relative '../lib/menu'
require_relative '../lib/takeaway'

require 'coveralls'
Coveralls.wear!

require 'capybara/rspec'
