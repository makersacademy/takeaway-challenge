require 'twilio-ruby'
class SendSms
  def initialize(client = nil, env = ENV)
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @phone_num = ENV["PHONE_NUM"]
    @twilio_num = ENV["TWILIO_NUM"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @env = env
  end

  def send_message
    @client.messages.create(
    to: ENV["PHONE_NUM"],
    from: ENV["TWILIO_NUM"],
    body: "Thank you for your order, your delivery will arrive before #{delivery_time}."
    )
  end

  def delivery_time
    time = Time.new + 60 * 60
    time.strftime("%H:%M")
  end
end
