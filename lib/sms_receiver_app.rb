require 'sinatra'
require './lib/sms_receiver'
require 'shotgun'
require 'twilio-ruby'

sms_receiver = SMSReceiver.new
test_string = "Spaghetti and Meatballs: 1"

get '/sms-takeaway-order' do
  input = params['Body'] ||= test_string
  body = input.downcase.strip
  order = sms_receiver.parse_order(body)

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: sms_receiver.respond(order))
  end

  twiml.to_s
end
