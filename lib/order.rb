require_relative 'menu'
require_relative 'sms'

class Order

  attr_reader :menu, :menu_class

  def initialize(menu_class=Menu, sms_class=Sms)
    @menu_class = menu_class
    @menu = menu_class.new
    @sms_class = sms_class 
    @current_order = Hash.new
  end

  def add_to_order(dish, quantity)
    push_to_current_order(dish, quantity)
  end
    
  def see_dishes
   @menu.see_dishes 
  end

  def push_to_current_order(dish, quantity)
     @current_order[dish] = quantity
  end

  def order_total
    calculate_order_total
  end

  def calculate_order_total
    sum = 0
    @current_order.each do |dish, qty|
      sum += (@menu.see_dishes[dish] * qty )
    end
    sum
  end
  
  def place_order
    @sms = @sms_class.new
    @sms.send_order_confirmation
  end

end
