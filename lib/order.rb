require_relative 'menu'

class Order

attr_reader :food_order, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @food_order = []
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

end
