require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order, :order_class

  def initialize(order_class=Order)
     @order_class = order_class
     @order = @order_class.new
  end
  
  def see_dishes
    @order.see_dishes
  end

  def order_total
    @order.order_total
  end

  def confirm_order_total(total)
    raise "That is not correct, actual total = £#{order_total}" unless order_total_correct?(total)    
    @order.place_order
  end
   
  def add_to_order(dish, quantity)
    @order.add_to_order(dish, quantity)
  end 

  private

  def order_total_correct?(total)
    total == order_total
  end

end
