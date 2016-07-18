require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end
VCR.configure do |c|
  c.hook_into                :webmock
  c.cassette_library_dir     = 'cassettes'
end
