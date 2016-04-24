require_relative 'menu'
require_relative 'dish'

class Order
  attr_reader :dishes_ord, :menu

  def initialize(a_menu:)
    @dishes_ord = []
    @menu = a_menu
  end
  def add(dish, quantity)
    fail 'Dish is not on menu!' if !on_menu?(dish)
    dishes_ord << {dish: dish, quantity: quantity}
  end

  def total_order
    order_sum = 0
    dishes_ord.each do |hash|
      order_sum += hash[:dish].price * hash[:quantity]
    end
    order_sum
    end

  def on_menu?(dish)
   menu.have_dish?(dish)
  end

  def ver_order?(total, dishes_ord)
    fail 'Wrong total amount for order' unless total == total_order
   end
end
