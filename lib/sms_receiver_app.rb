require 'sinatra'
require './lib/sms_receiver'
require 'shotgun'
require 'twilio-ruby'

sms_receiver = SMSReceiver.new

get '/sms-takeaway-order' do
  body = params['Body'].downcase.strip
  order = sms_receiver.parse_order(body)

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: sms_receiver.respond(order))
  end

  twiml.to_s
end

get '/help' do
  sms_receiver.help
end
