require_relative 'menu'
require_relative 'send_sms'

class Takeaway

attr_reader :food_order, :menu
  def initialize(menu = Menu.new, message = Sendsms.new)
    @menu = menu
    @food_order = []
    @message = message
  end

  def order_food(food, quantity)
    @food_order << {:food => food, :quantity => quantity}
  end
    
  def print_order
    p @food_order
  end

 def total_cost
    sum = 0
    @food_order.each do |food|
      sum += @menu.menu[food[:food]] * food[:quantity]
   end
   sum
 end 

  def is_correct_cost?(price)
    total_cost == price
  end
  

  def checkout(value)
    raise "Incorrect total" if !is_correct_cost?(value)
    @message.send_message("Thank you! Your order was placed and will be delivered within 1 hour")
  end    
end
