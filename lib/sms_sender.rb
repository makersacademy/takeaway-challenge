require 'bundler'
require 'dotenv'
Dotenv.load

Bundler.require()

class SMSSender
  SENDER_NO = '+441244470167'

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @recipient = ENV['MY_PHONE_NUMBER']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_order_confirmation(total)
    send("Thank you for your order! Order total: £#{'%.2f' % total}.")
    puts 'You will receive a confirmation text shortly.'
  end
  
  private

  def send(message)
    @client.messages.create(
      to: @recipient,
      from: SENDER_NO,    
      body: message
    )
  end
  
end
