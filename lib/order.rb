require_relative 'text'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Order
  include Text
  attr_reader :orders
  def initialize
    @orders = []
    @cost = 0
  end

  def choose_dish(menu, dish, quantities)
    order = menu.show.select { |item| item[:dish] == dish }.first
    @orders << {dish: dish, price: order[:price], quantities: quantities}
  end

  def check_orders
    orders.each { |order| @cost += order[:price] * order[:quantities]}
    "You will be charged £#{@cost}."
  end

  def place_orders(price)
    orders.each do |order|
      order[:paid] = true
      order[:created_at] = Time.now
    end
  end
  # def execute_orders
  #   orders.map do |order|
  #     order[:paid] = true
  #     order[:ordered_at] = Time.now.strftime("%b %e, %Y %H:%M")
  #   end
  #   Text.send_text_message
  #   orders
  # end

  # private
  #
  # def total_price
  #   sum = 0
  #   orders.each do |order|
  #     sum += order[:price] * order[:quantities]
  #   end
  #   sum
  # end
end
