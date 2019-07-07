require 'pry'
require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :current_order, :complete
  attr_accessor :user_total

  def initialize(menu = Menu.new)
    @current_order = []
    @menu = menu
    @complete = false
  end

  def select_dish(dish, quantity)
    add_dish(dish, quantity)
    { dish => quantity }
  end

  def order_total
    total = 0
    current_order.each do |item|
      total += item_quantity(item) * item_price(item)
    end
    total
  end

  def check_total(user_total)
    raise 'Total given does not match' unless user_total == order_total
    user_total == order_total
  end

  def confirm_order(mobile = '+4412345678')
    Text.new(mobile).send
    @complete = true
    @current_order = []
  end

  private

  def add_dish(dish, quantity)
    current_order << { dish => quantity }
  end

  def item_price(item)
    @menu.dish_price(item.keys.join)
  end

  def item_quantity(item)
    item.values.join.to_i
  end

  def complete?
    @complete
  end

end

binding.pry
