require 'twilio-ruby'
class MessageSender
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_message(to, message)
    @client.api.account.messages.create(
      from:  @twilio_number,
      to:    to,
      body:  message,
    )
  end
end
