require 'twilio-ruby'

class TextMessage

  def initialize
    @account_sid = ENV['accsid'] # Your Account SID from www.twilio.com/console
    @auth_token = ENV['token']   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    message = @client.messages.create(
      body: "Your order has been placed and will be with you by #{Time.now + 1}",
      to: ENV['mobile'],    # Replace with your phone number
      from: ENV['tmobile'])  # Replace with your Twilio number
    puts message.sid
end
