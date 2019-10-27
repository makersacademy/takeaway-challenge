require 'twilio-ruby'

class Confirminator

  def confirm(delivery_time)
    account_sid = ENV["ACC_SID"] # Account SID from twilio
    auth_token = ENV["AUTH_TOKEN"]   # Auth Token from twilio

    client = Twilio::REST::Client.new account_sid, auth_token
    client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: ENV["MY_NUMBER"],    # Recipient phone number
        from: ENV["MAGIC_NUMBER"])  # Magic Number for creating SMS
  end
end
