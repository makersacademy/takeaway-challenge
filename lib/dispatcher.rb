require 'twilio-ruby'

class Dispatcher

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def dispatch(order_id)
    @client.messages.create(
    body: "Thank you! Your order #{order_id} was placed and will be delivered before #{calculate_time}",
    to: "+445555555555",
    from: "+15005550006"
)
  end

  private
  def calculate_time
    t = Time.now + 360
    "#{t.hour}:#{t.min}"
  end

end



