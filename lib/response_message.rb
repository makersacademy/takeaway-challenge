require 'twilio-ruby'
require 'sinatra'
require_relative 'menu'
require 'pp'
get '/sms' do
  # parses it and lowercases it

  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    resp.message(body: "Thanks for your message! Someone on our team will go over your order and send you a text when it's ready.")
  end

  twiml.to_s
end

get '/unique-response' do
  menu = Menu.new
  body = params['Body'].downcase

  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == "menu"
      resp.message body: "Here is our current menu:\n#{menu.formatted_menu}. \nPlease select a dish."
    elsif body == "pelmeni"
      resp.message body: "That will be £6.99."
    else
      resp.message body: "Have a good day."
    end
  end

  twiml.to_s
end