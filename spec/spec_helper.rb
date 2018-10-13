require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'twilio-ruby'
require 'webmock/rspec'

ENV['ACC_SID'] = 'ACeeb78433dcba23619b98cde03e52ad52'
ENV['AUTH_TOKEN'] = 'a94d23d1ddf68e710fc6a823c7e50380'
ENV['FROM'] = '+441202286113'
ENV['TO'] = '+447982787204'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
