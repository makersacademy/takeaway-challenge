class Order
    require './lib/menu'
    attr_accessor :order 
    def initialize(menu = Menu.new) 
         @order = []
         @menu = menu
    end 
   
    def add(item)
        @pizzas = {
            "cheese" => 10,
            "pepperoni" => 12,
            "hawaiian" => 13,
            "vegetarian" => 13,
            "meat" => 15 }
        
      @order.push(["#{item}", @pizzas[item]])
    end 
end 

