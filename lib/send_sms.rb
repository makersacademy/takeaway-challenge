require 'twilio-ruby'
require 'dotenv'

Dotenv.load

module Twilio

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']
  TWILIO_NO = ENV['TWILIO_NO']
  MY_NO = ENV['MY_NO']

  def Twilio.send_sms(value)

    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    client.account.messages.create(
        :from => TWILIO_NO,
        :to => MY_NO,
        :body => "The total to pay is #{value}. Your food will arrive in 30 mins."
      )
  end
end
