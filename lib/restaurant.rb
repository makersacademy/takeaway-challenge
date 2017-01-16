require 'order'

class Restaurant
  attr_accessor :twiliohelper
  
  def confirm(order_list, total)
    raise 'Cannot place order: total is wrong' unless correct_total?(order_list, total)
    delivery_time = (Time.new + 60*60).strftime("%R")
    confirmation_msg = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @twiliohelper.send(confirmation_msg)
  end

  def correct_total?(order_list, total)
    order = Order.new
    order.dishes += order_list
    order.total == total
  end

end
