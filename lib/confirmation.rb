require 'twilio-ruby'

class Confirmation
    
  def initialize(env = ENV, client = nil)
    @env = env
    @client = client || Twilio::REST::Client.new(env["TWILIO_ACCOUNT_SID"], env["TWILIO_AUTH_TOKEN"])
  end
  
  def send_message
    @client.messages.create(
      message_contents
    )
  end

  def message_contents
    { from: @env['TWILIO_PHONE_NO'],
    to: @env['PHONE_NO'],
    body: "Thank you! Your order was placed and will be delivered shortly." }
  end


end
