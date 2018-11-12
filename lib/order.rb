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

  def add(name, quantity = 1)
    quantity.times { order << @restaurant.dish(name) }
  end

  def check
    check = ""
    total = 0
    @order.each do |dish|
      total += dish.price
      check << "\n#{dish.name} - #{dish.price}"
    end
    check << "\nYour total is £#{total}.\n"
    check << "It will be delivered at #{Time.now.hour + 1}:#{Time.now.min}"
  end

  def confirm
    @restaurant.confirm(@order)
    send_text
  end

  def send_text
    @client = @text_class.new Text::ACCOUNT_SID, Text::AUTH_TOKEN
    message = @client.messages.create(
        body: check,
        to: Text::MY_NUMBER,
        from: Text::TWILIO_NUMBER)
    puts message.sid
  end

end
