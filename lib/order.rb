class Order
    require './lib/takeaway'
    attr_accessor :order, :takeaway  
    def initialize 
         @order = []
         @takeaway = Takeaway.new 
    end 
# this adds items to the @order array but also returns 
# nil for the other menu items. 
    def add(item)
        @takeaway.menu.map {|food, price|
            if item == food
            @order << "#{item}, #{price}" end }.reject(&:nil?)
        end 

    def total 

    end 
end 
