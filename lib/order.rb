require 'pry'
require_relative 'menu'

class Order

  attr_reader :current_order, :user_total

  def initialize(menu = Menu.new)
    @current_order = []
    @menu = menu
  end

  def select_dish(dish, quantity)
    @current_order << { dish => quantity }
    { dish => quantity }
  end

  def order_total
    total = 0
    @current_order.each do |item|
      total += item.values.join.to_i * @menu.dish_price(item.keys.join)
    end
    total
  end

  def check_total(user_total, order_total)
  end

end

binding.pry
