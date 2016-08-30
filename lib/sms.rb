require 'twilio-ruby'
require './config/initializers/app_env_vars'

class SMS
  def initialize(number)
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @number = number
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV["TWILIO_NUM"]
  end

  def send_message
    delivery_time = Time.now + (60*60)

    @client.account.messages.create(
      from: @from,
      to: @number,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"
    )
  end
end

#  form: https://www.twilio.com/docs/quickstart/ruby/programmable-sms#send-sms
