require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Checkout

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']
  TWILIO_NUM = ENV['TWILIO_NUM']
  MY_NUM = ENV['MY_NUM']

  def initialize(client)
    @client = Twilio::REST::client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_sms
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
