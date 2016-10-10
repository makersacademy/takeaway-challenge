require 'twilio-ruby'
require 'dotenv'

class Texter
  def initialize
    Dotenv.load
    @twilio_phone = ENV['T_PHONE']
    @customer_phone = ENV['MY_PHONE']
    @twilio_sid = ENV['SID']
    @twilio_token = ENV['TOKEN']
    delivery_time
    send_message
  end

  def send_message
    @twilio_client = Twilio::REST::Client.new @twilio_sid, @twilio_token
    @twilio_client.account.messages.create(
      :from => @twilio_phone,
      :to => @customer_phone,
      :body => "Thank you for ordering from Malinna's Tasty Takeaway! Your order will be delivered before #{@time}."
    )
  end

  def delivery_time
    time = Time.new + 60*60
    @time = "#{time.hour}:#{time.min}"
  end
end
