require 'twilio-ruby'

class TextMessage
  attr_reader :account_sid, :auth_token, :client

  def initialize
    @account_sid = ENV['accsid'] # Your Account SID from www.twilio.com/console
    @auth_token = ENV['token']   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
      @client.messages.create(
      body: "Your order has been placed and will be with you by #{(Time.now + 3600).strftime("%H:%M")}",
      to: ENV['mobile'],    # Replace with your phone number
      from: ENV['tmobile'])  # Replace with your Twilio number
    end
end
