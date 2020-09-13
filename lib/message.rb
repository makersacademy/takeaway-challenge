require "twilio-ruby"

class Message
  def initialize(account_sid, auth_token, account_phone_num, twilio_type = Twilio::REST::Client)
    @client = twilio_type.new(account_sid, auth_token)
    @account_phone_num = account_phone_num
  end

  def send_message(phone, message)
    @client.messages.create(
      from: @account_phone_num,
      to: phone,
      body: message,
    )
  end
end
