require 'twilio-ruby'



class Text

  def send_text
    delivery_time = Time.new (60 * 60)
    account_id = ENV["TWILIO_ACCOUNT_ID"]
    account_auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_id, account_auth_token

    @message = @client.messages.create(
    to: ENV["RECIPIENT_NUMBER"],
    from: ENV["TWILIO_NUMBER"],
    body: "Thank you! Your order was placed and will be delivered at #{delivery_time}."
    )
  end
end
