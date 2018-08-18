require 'twilio-ruby'

class Sms

  def initialize
    account_sid = 'twilio acc sid'
    auth_token = 'twilio auth token'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
      message = @client.messages.create(
        body: "Thank you! Your order will be delivered by #{delivery_time}",
        to: "my number",
        from: "your number")
  end

  def delivery_time
    Time.now + 3600
  end

end
