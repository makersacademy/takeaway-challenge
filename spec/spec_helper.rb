require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

