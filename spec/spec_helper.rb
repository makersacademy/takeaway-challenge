require 'dotenv/load'
require 'simplecov'
require 'simplecov-console'
require 'rubygems'
# require 'test/unit'
require 'webmock/rspec'
require 'vcr'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.define_cassette_placeholder("account_sid", ENV["ACCOUNT_SID"])
  config.define_cassette_placeholder("from", ENV["ACCOUNT_NUMBER"])
  config.define_cassette_placeholder("to", ENV["CUSTOMER_NUMBER"])
end
