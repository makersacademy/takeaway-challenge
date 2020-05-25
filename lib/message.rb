class Message
  require 'twilio-ruby'
  require 'date'

  def initialize
    account_sid = 'AC70d417911c9dc33b2d343c6be8956f4f'
    auth_token = '3f5ac212ee68ad4e9c09a5e61d88490c'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    time = (Time.now + 3600).strftime("%I:%M")
    @client.messages.create(
      from: '+12069845087',
      to: '+447919841263',
      body: "Thank you! Your order has been placed and will be with you before #{time}"
    )
  end

end
