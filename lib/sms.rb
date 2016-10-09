require 'twilio-ruby'

class Sms

  attr_reader :delivery_time

  ACCOUNT_SID = 'AC3ab2372a12e90b1731ec86a02414993c'
  AUTH_TOKEN = 'd02ae455182307fc008c987483acc638'

  def initialize
    delivery_time
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @from = '+441143032718'
    @to = '+447756204519'
  end

  def delivery_time
    delivery_time = Time.new + 2700
    @delivery_time = "#{delivery_time.hour}:#{delivery_time.min}"
  end


  def send
    @client.account.messages.create({ from: @from,
      to: @to, body: "Thank you! Your order was placed and will be delivered before #{@delivery_time}"})
  end


end
