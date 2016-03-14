require_relative 'order'
require_relative 'sms'

class Takeaway
  
  def initialize(order_class=Order, sms_class=Sms)
     @order_class = order_class
     @order = @order_class.new
     @sms_class = sms_class
  end
  
  def see_dishes
    @order.see_dishes
  end


  def confirm_order_total(total)
    @order.place_order(total)
    @sms = @sms_class.new
    @sms.send_order_confirmation
  end
   
  def add_to_order(dish, quantity=1)
    @order.add_to_order(dish, quantity)
  end 

  def order_total
    @order.order_total
  end

end
