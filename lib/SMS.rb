require 'twilio-ruby'
require 'sinatra'
require 'time'

# This sends a text to the client
class SMS
  attr_reader :order, :cost

  def initialize(order, cost)
    @order = order
    @cost = cost
    send_message
  end

  def send_message
    account_sid = "ACf2b06a33d12860426f72e6acbf307c69" # Your Account SID from www.twilio.com/console
    auth_token = "7f52dabed4ddd5420cfccf435c9cf55b"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: ":\nThank you for your order, it will be with you before #{check_time}\n\nTotal cost: £#{@cost}\n\nYour order:\n#{print_order}",
        to: "+447891112443",    # Replace with your phone number
        from: "+441233800977")  # Replace with your Twilio number
    puts message.sid
  end

  def print_order
    output = ""
    @order.each do |_key, dish|
      output += "#{dish.name} £#{dish.price.inspect} x#{dish.quantity} \n"
    end
    output
  end

  def check_time
    current = Time.new
    current.localtime + (60*60)
    "#{current.hour}:#{current.min}"
  end
end
