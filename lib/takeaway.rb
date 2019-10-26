require_relative 'menu'

class TakeAway
   def initialize(menu: Menu.new)
     @todays_dishes = menu.view_list
   end

   def view_menu
     @todays_dishes
   end

   def order
     @basket = {}
     while true do
       puts "Please enter the dish (to finish your order, hit return twice)."
       @item = STDIN.gets.chomp
       if @item.empty?
         break
       end
       puts "Please enter the quantity."
       @quantity= STDIN.gets.chomp.to_i
       puts "#{@quantity} x #{@item} added"
       @basket[@item] = @quantity
     end
     @basket
   end

   def view_basket
     @basket
   end
end
