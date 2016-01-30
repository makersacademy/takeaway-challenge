require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Sms

  def initialize
    @account_sid = 'AC5f0916482a7dd3822a118d4b27a4e49b'
  end

  def client
    @client = Twilio::REST::Client.new @account_sid, ENV['AUTH_TOKEN']
  end

  def send(order_number)
    text(order_number)
    client.account.messages.create(
    	from: '+441625800275',
      to:   ENV['MOBILE'],
      body:  @message)
  end

  def text(order_number)
    @message = "Thank you! Your order:#{order_number} was placed"\
              " and will be delivered before"\
              " #{Time.now.hour + 1}:#{Time.now.min}"
  end

end
