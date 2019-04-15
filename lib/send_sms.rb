require 'dotenv/load'
require 'twilio-ruby'

class SendSMS

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @from = ENV['TWILIO_TRIAL_NUMBER'] # Your Twilio number
    @to = ENV['TWILIO_VERIFIED_NUMBER'] # Your mobile phone number
  end

  def send
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
      )
  end

  private

  def delivery_time
    Time.now + (60 * 60)
  end
end
