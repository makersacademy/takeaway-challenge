class Menu

 attr_reader :dishes, :total

 def initialize
   @dishes = {}
 end

 def add_to_menu(dish, price)
   @dishes[dish] = price
 end

 def check_out(takeaway)
   @total = 0
   takeaway.finished_order.each do |dish, quantity|
     @total += @dishes[dish] * quantity
   end
   @total
 end
end