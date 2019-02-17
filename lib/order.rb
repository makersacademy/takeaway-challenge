require_relative 'menu'

class Order

   attr_reader :dishes

   def initialize(menu)
     @dishes = {}
     @menu = menu
   end

   def add(dish, quantity)
     dishes[dish] = quantity
   end

   def total
     item_totals.reduce(:+)
   end

   def item_totals
     dishes.map { |dish, quantity| menu.price(dish) * quantity }
   end

   private
   attr_reader :menu

end
