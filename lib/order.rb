require 'menu'
# require 'total'

class Order
  
  attr_reader :order, :menu

  def initialize
    @order = []
    @menu = Menu.new
  end

  def order_dish(quantity = 1, dish)
    raise "This dish is not on the menu, please choose another one!" unless dish_on_menu?(dish)
    
    quantity.times { @order << @menu.select(dish) }
    @order
  end

  def confirm_order
    checkout = Checkout.new
    checkout.order_checkout(order)
  end

  private

  def dish_on_menu?(dish)
    menu.select(dish)
  end
end
