require 'twilio-ruby'

class Message

  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'],ENV['AUTH_TOKEN'])
  end

  def send(order)
    client.messages.create(
    to: "+447709344456",
    from: "+441233800814",
    body: "Thank you for your order of:\n#{format_order(order)}\nIt will be delivered by #{delivery_time}."
    )
  end

private

  attr_reader :client

  def format_order(order)
    message = ""
    order.each{|k,v| message << "#{v} x #{k}\n"}
    message.chomp
  end

  def delivery_time
    "#{Time.new.hour + 1}:#{Time.new.min}"
  end

end
