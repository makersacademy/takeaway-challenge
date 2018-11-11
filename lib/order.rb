require_relative 'restaurant'
require_relative 'text'
require "twilio-ruby"

class Order

  attr_reader :order

  def initialize(restaurant, text_service = Twilio::REST::Client)
    @restaurant = restaurant
    @order = []
    @text_class = text_service
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
    order_check << "Your total is £#{total}.\nIt will be delivered at #{Time.now + 60*60}"
  end

  def confirm
    @restaurant.confirm(@order)

    @client = text_class.new Text::ACCOUNT_SID, Text::AUTH_TOKEN
    message = @client.messages.create(
        body: self.check,
        to: "+447713920330",    # Replace with your phone number
        from: "+441469727010")  # Replace with your Twilio number

    puts message.sid
  end

end
