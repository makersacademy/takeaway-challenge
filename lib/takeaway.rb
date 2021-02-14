require 'sinatra'
require 'twilio-ruby'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = [
      { item: 'Marinara', price: 7.50 },
      { item: 'Margherita', price: 8.95 },
      { item: 'Bufala DOP', price: 11.25 },
      { item: 'Nduja', price: 11.50 },
      { item: 'Double Pepperoni & Spicy Honey', price: 12.95 },
      { item: 'Mushroom & Truffle', price: 11.95 },
      { item: 'The 8-Cheeses Pizza', price: 11.50 },
    ]
  end

  def browse
    @menu.each_with_index do |dish, index|
      puts "#{index + 1} - #{dish[:item]} £#{dish[:price]}"
    end
  end

  def start_order
    @my_order = Order.new
  end

  def add(index, quantity = 1, order_id = @my_order)
    add_items(index, quantity, order_id)
    add_prices(index, quantity, order_id)
  end

  def basket(order_id = @my_order)
    order_id.print_order
  end

private

  def add_items(index, quantity, order_id)
    item = @menu.at(index - 1)[:item]
    quantity.times { order_id.items_ordered << item }
  end

  def add_prices(index, quantity, order_id)
    price = @menu.at(index - 1)[:price]
    quantity.times { order_id.items_price << price }
  end
end

# get '/' do
#   content_type 'text/xml'
#
#   Twilio::TwiML::VoiceResponse.new do | response |
#     response.say(message: 'Hello Sandy')
#   end.to_s
# end
