require 'twilio-ruby'
require 'rubygems'

class Messaging
  def send_text(message)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
        body: message,
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: ENV['PHONE_NUMBER']
    )
  end
end