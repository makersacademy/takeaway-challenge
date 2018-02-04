require 'twilio-ruby'

class Text
  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"] # Your Account SID www.twilio.com/console
    auth_token = ENV["TWILIO_AUTH_TOKEN"]   # Your Auth Token www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def send_text(order_total_value)
    message = @client.messages.create(
        body: text_body(order_total_value),
        to: ENV["MY_PHONE_NUMBER"], # Replace with your phone number
        from: ENV["MY_TWILIO_NUMBER"]) # Replace with your Twilio number
    message.sid
  end

  def text_body(order_total_value)
    one_hour_later = (Time.now + (60 * 60)).strftime("%H:%M")
    "Thank you! Your order was placed for £#{order_total_value} and "\
    "will be delivered before #{one_hour_later}"
  end

end
