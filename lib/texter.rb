require 'twilio-ruby'

class Texter
  def initialize
    @twilio_phone = "1133203273"
    @customer_phone = "7899877238"
    @twilio_sid = "AC39ab6016fda768cc8f0ead6f313370ca"
    @twilio_token = "31582c1fc17eebcd2554a4eca9bc6dd9"
    delivery_time
    send_message
  end

  def send_message
    @twilio_client = Twilio::REST::Client.new @twilio_sid, @twilio_token
    @twilio_client.account.messages.create(
      :from => @twilio_phone,
      :to => @customer_phone,
      :body => "Thank you for ordering from Malinna's Tasty Takeaways! Your order will be delivered before #{@time}"
    )
  end

  def delivery_time
    time = Time.new + 60*60
    @time = "#{time.hour}:#{time.min}"
  end
end
