require 'rubygems'
require 'twilio-ruby'

  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "wow that worked!"
  end
  twiml.text
