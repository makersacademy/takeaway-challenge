require 'twilio-ruby'

class Message

  def initialize
    account_sid = 'AC0957a85f231fb55be424a47ea1b568b7'
    auth_token = '2abe63c8a89276491e691796c290fa45'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    @client.messages.create(
      from: "+441202286284",
      to: "+447426382746",
      body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    )
  end
end
