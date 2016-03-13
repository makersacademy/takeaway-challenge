require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Checkout

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']
  TWILIO_NUM = ENV['TWILIO_NUM']
  MY_NUM = ENV['MY_NUM']

  def send_sms
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @client.messages.create(
      from: TWILIO_NUM,
      to: MY_NUM,
      body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end

  private

  def time
    "#{Time.now.hour + 1}:#{Time.now.min}"
  end

end
