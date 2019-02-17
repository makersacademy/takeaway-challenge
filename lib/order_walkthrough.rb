class Order
   # attr_reader :dishes, :menu
   #
   # def initialize(menu)
   #   @dishes = {}
   #   @menu = menu
   # end

   attr_reader :dish, :quantity
   def initialize(dish, quantity)
     @dish = dish
     @quantity = quantity
   end

   def add(dish, quantity)
     fail NoItemError, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
     dishes[dish] = quantity
  end
end

class NoItemError < StandardError; end
