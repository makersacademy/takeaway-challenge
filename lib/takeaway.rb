require_relative 'menu.rb'
require_relative 'order.rb'

class TakeAway
  
  def initialize(order = Order.new)
    @order = order
  end
  
  def read_menu
    @order.menu
  end
  
  def complete_order(price)
    raise "Value does not match the total" unless is_correct_amount?(price)
    "Order Complete"
  end
  
  def order(dish, quantity = 1)
    add_dish_to_order(dish, quantity)
  end
  
  def basket_summary
    @order.current_order
  end
  
  def total
    basket_summary
    "Total: £" + "%.2f" % @order.total_amount
  end
  
  private 
  
  def add_dish_to_order(dish, quantity)
    @order.add_dish_to_basket(dish, quantity)
  end
  
  def is_correct_amount?(price)
    @order.total_amount == price
  end
end