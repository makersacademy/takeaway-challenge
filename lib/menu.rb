class Menu

attr_reader :show_menu, :food, :price

   def initialize
     @show_menu = []
     @food = food
     @price = price 
   end

   def dishes(food, price)
    menu = {}
    menu.store(food, price)
    @show_menu << menu
   end

end

