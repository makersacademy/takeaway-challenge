require 'dotenv'
require 'twilio-ruby'

class Message

  attr_reader :client

  def initialize
    @credentials = Dotenv.load
    @client = Twilio::REST::Client.new(
      @credentials['twilio_account_sid'], @credentials['twilio_auth_token']
    )
  end

  def send_sms
    @client.account.messages.create(
    from: @credentials['TWILIO_NUM'],
    to: @credentials['MY_NUM'],
    body: "Thank you! Your order was placed and will be delivered \
    before #{Time.new.hour+1}:#{Time.new.strftime("%M")}"
    )
  end
end
