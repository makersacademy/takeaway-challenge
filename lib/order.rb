require_relative 'restaurant'
require "twilio-ruby"

class Order

  attr_reader :order

  def initialize(restaurant)
    @restaurant = restaurant
    @order = []
  end

  def list_dishes
    @restaurant.list_dishes
  end

  def add(name,quantity = 1)
    quantity.times { order << @restaurant.dish(name) }
  end

  def check
    order_check = ""
    total = 0
    @order.each do |dish|
      total += dish.price
      order_check << "#{dish.name}-#{dish.price}\n"
    end
    order_check << "Your total is £#{total}.\n"
  end

  def confirm
    @restaurant.confirm(@order)


    account_sid = "AC86dc289721e21ddbdad9b772ba094d37" # Your Account SID from www.twilio.com/console
    auth_token = "a40461cf687f5d27129c668b8c95ff66"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: self.check,
        to: "+447713920330",    # Replace with your phone number
        from: "+441469727010")  # Replace with your Twilio number

    puts message.sid

  end

end
