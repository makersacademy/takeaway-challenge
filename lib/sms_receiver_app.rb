require 'sinatra'
require './lib/sms_receiver'
require 'shotgun'
require 'twilio-ruby'


sms_receiver = SMSReceiver.new

get '/sms-takeaway-order' do
  body = params['Body'].downcase
  order = sms_receiver.parse_order(body)

  twiml = sms_receiver.text_api.new do |r|
    r.message(body: sms_receiver.order_confirmation(order))
  end

  twiml.to_s
end

get '/help' do
  sms_receiver.help
end
