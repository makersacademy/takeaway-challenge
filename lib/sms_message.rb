require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMSMessage

  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'],ENV['AUTH_TOKEN'])
  end

  def send(order)
    client.messages.create(
    to: "+447709344456",
    from: "+441233800814",
    body: "#{format_order(order)}"
    )
  end

private

  attr_reader :client

  def format_order(order)
    message = "Thank you for your order of:\n"
    order.each{|k,v| message << "#{v} x #{k}\n"}
    message << delivery_time
    message
  end

  def delivery_time
    "It will be delivered by #{Time.new.hour + 1}:#{Time.new.min}."
  end

end
