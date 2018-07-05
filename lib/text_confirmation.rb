require 'twilio-ruby'

class TextConfirmation
  CONFIGURATION = {
    from: ENV['TWILIO_PHONE_NUMBER'],
    account_sid: ENV['TWILIO_ACCOUNT_SID'],
    auth_token: ENV['TWILIO_AUTH_TOKEN']
  }

  def initialize(client = Twilio::REST::Client.new(
    CONFIGURATION[:account_sid],
    CONFIGURATION[:auth_token]
  ))
    @client = client
  end

  def send_message(amount, number = ENV['MY_PHONE_NUMBER'])
    client = @client
    time = Time.new
    message_config = {
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: number,
      body: "Thank you for your order.
Total order price: £#{amount}.
Expected delivery time: #{time.hour + 1}:#{time.min}." }
    client.messages.create(message_config)
  end
end
