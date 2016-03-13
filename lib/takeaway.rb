require_relative 'menu'
require_relative 'order'

class Takeaway
  WRONG_TOTAL_ERR = "That is not correct, total = £#{@order_total}"
  INVALID_DISH_ERR = "We don't have that dish"
  def initialize(order_class=Order)
     @order_class = order_class
     @order = @order_class.new
  end
  
  def see_dishes
    @order.see_dishes
  end

  def order_total
    @order_total = @order.order_total
  end

  def confirm_order_total(total)
    raise WRONG_TOTAL_ERR unless order_total_correct?(total)    
    @order.place_order
  end
   
  def add_to_order(dish, quantity=1)
    raise INVALID_DISH_ERR unless real_dish?(dish)
    @order.add_to_order(dish, quantity)
  end 

  private

  def order_total_correct?(total)
    total == order_total
  end

  def real_dish?(dish)
    @order.real_dish?(dish)
  end

end
