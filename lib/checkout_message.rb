require 'twilio-ruby'
require 'time'


class CheckOutMessage

  def initialize(client = (Twilio::REST::Client))
    @account_sid = ENV["TWILIO_KEY"] # Your Account SID from www.twilio.com/console
    @auth_token = ENV["TWILIO_TOKEN"]   # Your Auth Token from www.twilio.com/console
    @client = client.new @account_sid, @auth_token
  end

  def send_text
    @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time_plus_hour}",
        to: ENV["P_PHONE"],    # Replace with your phone number
        from: ENV["T_PHONE"])  # Replace with your Twilio number
  end

private

  def time_plus_hour
    time = Time.new
    time = (time + 3600).strftime("%H:%M")
    return time
  end

end
