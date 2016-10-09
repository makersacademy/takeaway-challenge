require 'sinatra'
require 'twilio-ruby'

account_sid = "ACbae83da0b5b8132dc7c75548b59e6234"
auth_token = "385138931f39cb4549f0cdce93efbea0"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+441163263729" # Your Twilio number

friends = {"+447795403523" => "Frankie"}

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end

get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hey Monkey. Thanks for the message!"
  end
  twiml.text
end
