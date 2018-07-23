require 'twilio-ruby'
require 'time'

class Text
  attr_reader :text

  def delivery_time
    if Time.now.min < 30
      "#{Time.now.hour}:#{Time.now.min + 30}"
    else
      "#{Time.now.hour + 1}:#{Time.now.min - 30}"
    end
  end

  def text
  account_sid = "AC6d3fc85f87313224127926e70b5a5256" # Your Account SID from www.twilio.com/console
  auth_token = "fe0e76376cef293f7fbb070f0b757a2d"   # Your Auth Token from www.twilio.com/console

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Thank you for your order, your food will arrive at #{delivery_time}",
      to: "+447534938323",    # Replace with your phone number
      from: "+441277424726")  # Replace with your Twilio number

    puts message.sid
  end
end
