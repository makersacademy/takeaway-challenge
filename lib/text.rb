require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  ACC_SID = ENV["TWILIO_ACC_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]

  def confirmation
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
    :from => ENV['TWILIO_NUM'],
    :to => ENV['CUSTOMER_NUM'],
    :body => notice)
  end

  private

  def notice
    "Your order has been placed and is expected to arrive before #{delivery_time}"
  end

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end
end
