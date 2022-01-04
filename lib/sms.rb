require 'twilio-ruby'


class SMS
    DELIVERY_TIME_ESTIMATE = 3600

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_sms
    @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: ENV["MY_PHONE_NUMBER"],
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

  private

  def delivery_time
    time = Time.now + DELIVERY_TIME_ESTIMATE
    time.strftime("%I:%M %p")
  end
end