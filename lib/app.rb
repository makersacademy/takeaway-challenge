require 'twilio-ruby'

class Message
  attr_reader :price, :account_sid, :auth_token

  def initialize(price)
    @price = price
    @account_sid = "AC4588793b054267a992b7ddd807c78dc8"
    @auth_token = "dae91b2669e9d00e08d8c839ba27ffef"
  end

  def send_sms
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order totalling £#{price} was placed and will be delivered before 18:52",
      to: "+447856274685",
      from: "+441315104037")
  end

end
