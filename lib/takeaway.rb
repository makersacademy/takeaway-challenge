require_relative 'order.rb'
require_relative 'messager.rb'

class TakeAway
  
  def initialize(order = Order.new, messager = Messager.new)
    @order = order
    @messager = messager
  end
  
  def read_menu
    @order.menu
  end
  
  def complete_order(price)
    fail "Value does not match the total" unless correct_amount?(price)
    send_text("Thank you! Your order was placed.")
  end
  
  def order(dish, quantity = 1)
    add_dish_to_order(dish, quantity)
  end
  
  def basket_summary
    @order.current_order
  end
  
  def total
    "Total: £" + "%.2f" % @order.total_amount
  end
  
  private 
  
  def add_dish_to_order(dish, quantity)
    @order.add_dish_to_basket(dish, quantity)
  end
  
  def send_text(message)
    @messager.send_text(message)
  end
  
  def correct_amount?(price)
    @order.total_amount == price
  end
end