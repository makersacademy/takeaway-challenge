require_relative 'order'

class Takeaway
  
  def initialize(order_class=Order)
     @order_class = order_class
     @order = @order_class.new
  end
  
  def see_dishes
    @order.see_dishes
  end


  def confirm_order_total(total)
    @order.place_order(total)
  end
   
  def add_to_order(dish, quantity=1)
    @order.add_to_order(dish, quantity)
  end 

  def order_total
    @order.order_total
  end

end
