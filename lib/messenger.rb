require("bundler")
Bundler.require()

class Messenger
  attr_reader :account_sid, :auth_token, :client
  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_message
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%R")}"
    )
  end

end
