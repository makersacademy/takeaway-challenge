require 'rubygems'
require 'twilio-ruby'
require_relative '../credentials'

class TwilioManager
  def initialize
    @messaging_sid = MESSAGING_SID
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def client_exists?
    @client.nil? ? false : true
  end

  def send_sms(message_body, target_phone = TARGET_PHONE)
    message = @client.messages
      .create(
         messaging_service_sid: @messaging_sid,
         body: message_body,
         to: target_phone
       )
    message.sid
  end
end