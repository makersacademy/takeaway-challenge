require_relative 'menu.rb'

class Order
  attr_reader :order

  def initialize(menu)
    @order = {} # structure should be {dish => quantity}
    @order = Hash.new(0)
    @menu = menu
  end

  def add_to_order(dish, quantity)
    fail if menu.has_dish?(dish) == false
    @order[dish] = quantity
  end

  def remove_from_order(dish)
    order.delete(dish)
  end

  def order_total
    total = 0
    order.each do |dish, quantity|
      total += (quantity * menu.dish_price(dish))
    end
    total
  end

  private
    attr_reader :menu
end
