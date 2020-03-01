require 'twilio-ruby'

class SMS

  def initialize(phone_number, message, account_sid = ENV['TWILIO_ACCOUNT_SID'], auth_token = ENV['TWILIO_AUTH_TOKEN'])
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    #send_sms phone_number, message, from
  end

  def send_sms phone_number, message
    @client.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: phone_number,
    body: message
    )
  end

end
