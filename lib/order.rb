class Order
    require './lib/menu'
  attr_accessor :order 
    def initialize(menu = Menu.new) 
         @order = []
         @menu = menu
    end 
   # Why can't I access pizza from outside this method?? it only
   #works when I have the hash inside of it.
    def add(item)
        @pizzas = {
            "cheese" => 10,
            "pepperoni" => 12,
            "hawaiian" => 13,
            "vegetarian" => 13,
            "meat" => 15 }
        
      @order.push(["#{item}", @pizzas[item]])
    end 

    def total
        total = 0
       @order.each { |x|
        total += x[1] }
         total 
    end 
    def confirm_order
        "Your order has been placed"
    end 
end  

