require 'twilio-ruby'
require_relative 'undisclosed'

module Twilio

  ACCOUNT_SID = Undisclosed::ACCOUNT_SID
  AUTH_TOKEN = Undisclosed::AUTH_TOKEN

  def Twilio.send_sms(value)

    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    client.account.messages.create(
        :from => Undisclosed::TWILIO_NO,
        :to => Undisclosed::MY_NO,
        :body => "The total to pay is #{value}. Your food will arrive in 30 mins."
      )
  end
end
