require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

RSpec.configure do |config|
  config.failure_color = :yellow
  config.pending_color = :magenta
  config.tty = true
  config.color = true
end
