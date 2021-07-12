require 'twilio-ruby'

class TextMessage
  ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  @message = "Thank you! Your order was placed and will be delivered before #{@time}"

  def initialize(client: Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    from = '+447401130560'
    to = ENV["MY_PHONE_NUMBER"]
    @time = (Time.new + 3600).strftime("%k:%M")
    client.messages.create(
      from: from,
      to: to,
      body: @message
    )
  end
end
