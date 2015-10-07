require_relative 'menu'
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

  def choose_dish(dish, quantities)
    @orders << {dish: dish, quantities: quantities}
  end

  def check_orders(menu)
    @orders.each do |order|
      menu.show.each do |menu|
        if menu[:dish] == order[:dish]
          @cost += order[:quantities] * menu[:price]
        end
      end
    end
    "You will be charged £#{@cost}."
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
