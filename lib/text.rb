require 'twilio-ruby'

class Text

  attr_reader :message

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
    @client.account.messages.create(
      from:  ENV['TWILIO_NUM'],
      to:    ENV['MY_NUM'],
      body:  delivery_confirmation(message)
      )
  end

private

  def delivery_confirmation(message)
    message =
    "Thanks! Your order was placed and will be delivered by #{delivery_time}"
  end

  def delivery_time
    (Time.now + (60 * 60)).strftime("%H:%M")
  end

end
