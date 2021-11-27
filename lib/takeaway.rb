require_relative "menu"
require_relative "order"
require 'dotenv'
require 'twilio-ruby'
Dotenv.load("variables.env")

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @client = Twilio::REST::Client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
  end

  def show_menu
    @menu.show
  end

  def add_to_order(item)
    fail "Item not on menu, please choose something else" unless @menu.dishes.map { |dish| dish.name }.include?(item)
    @menu.dishes.each { |dish| order.add(dish) if dish.name == item }
  end

  def place_order
    fail "Please select some items before placing an order" if @order.show.empty?
    message = @client.messages.create(
    body: @order.message,
    to: ENV["MY_NUMBER"],
    from: ENV["TWILIO_NUMBER"])
  end

end
