require 'twilio-ruby'
require 'sinatra'
require 'time'
require 'dotenv/load'

# This sends a text to the client
class SMS
  attr_reader :order, :cost

  def initialize(order, cost)
    @order = order
    @cost = cost
    send_message
  end

  def send_message
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: ":\nThank you for your order, it will be with you before #{check_time}\n\nTotal cost: £#{@cost}\n\nYour order:\n#{print_order}",
        to: ENV['MY_NUMBER'],
        from: ENV['TWILIO_NUMBER'])
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
    current += (60 * 60)
    "#{current.hour}:#{current.min}"
  end
end
