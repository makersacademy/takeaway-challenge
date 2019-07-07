require 'twilio-ruby'
require 'time'


class Checkout

  def initialize(client = (Twilio::REST::Client))
    @account_sid = "AC3dacdc49158a31763601f3cd87e88f48" # Your Account SID from www.twilio.com/console
    @auth_token = "14a1891177aba79770d237c22e57b4de"   # Your Auth Token from www.twilio.com/console
    @client = client.new @account_sid, @auth_token
  end

  def show_final_order(order)
    order.summary
  end

  def send_text
    @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time_plus_hour}",
        to: "+447879633386",    # Replace with your phone number
        from: "+441543624317")  # Replace with your Twilio number
  end

private

  def time_plus_hour
    time = Time.new
    time = (time + 3600).strftime("%H:%M")
    return time
  end

end
