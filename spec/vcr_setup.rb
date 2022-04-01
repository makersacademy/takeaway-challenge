require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr/cassettes"
  config.hook_into :webmock
end