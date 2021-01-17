class Takeaway 
  attr_reader :basket, :menu, :grand_total
    
 def initialize 
   @menu = {"chow mein": 1.99, "chicken balls": 2.00, "duck pancakes": 1.00}
   @basket = []
   @grand_total = 0.00
 end
    
 def read_menu
   @menu
 end
 
 def order(dish, quantity=1 )
   @basket << "#{dish} x #{quantity}: #{total(dish, quantity)}"
   "You have added #{dish} x #{quantity}"
 end
 
 def total(dish, quantity)
   subtotal = @menu[dish.to_sym] * quantity
   @grand_total += subtotal
   subtotal
 end

end
