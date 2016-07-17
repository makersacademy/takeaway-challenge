require 'dotenv'
require 'twilio-ruby'

Dotenv.load

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

@client = Twilio::REST::Client.new

from = "+441212856445"
to=  { "+447535949272" => "Alex Saunders" }

to.each do |key, value|
  @message = @client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hello #{value}! Testing, 1..2..3"
    )
puts "Sent message to #{value}"
end
