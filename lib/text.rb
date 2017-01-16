module Text
  require 'twilio-ruby'

  def send_message(twilio_number, phone_number)
    account_sid = "ACc75b72a0ddcf8149871f9d29e2d6a35f"
    auth_token = "90a709909ee5b6e01d57d4a7696ffadb"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{Time.now + (60*30)}"
      )
    end
end
