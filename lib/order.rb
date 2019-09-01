require 'pry'
require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :current_order
  attr_accessor :user_total

  def initialize(menu = Menu.new)
    @current_order = {}
    @menu = menu
  end

  def select_dish(dish, quantity)
    raise "Dish not on menu." unless @menu.dishes.include?(dish)
    add_dish(dish, quantity)
  end

  def order_total
    total = 0
    current_order.each do |dish, quantity|
      total += quantity * item_price(dish)
    end
    total
  end

  def check_total(user_total)
    raise 'Total given does not match' unless user_total == order_total
    user_total == order_total
  end

  def confirm_order(mobile)
    Text.new(mobile).send
    @current_order = []
  end

  private

  def add_dish(dish, quantity)
    if @current_order.include?(dish)
      @current_order[dish] = @current_order[dish] + quantity
    else
      @current_order[dish] = quantity
    end
  end

  def item_price(dish)
    @menu.dish_price(dish)
  end

  def item_quantity(item)
    item.values.join.to_i
  end
end

# binding.pry
