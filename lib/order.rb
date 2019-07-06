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
    dishes = @menu.list_dishes
    @current_order.each do |item|
      if dishes.include?(item)
        total += @menu.list_dishes[item.key] * @menu.dish_price(item.key)
      end
    end
    total
  end

  def check_total(user_total, order_total)
  end

end

binding.pry
