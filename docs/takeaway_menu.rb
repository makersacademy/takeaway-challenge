class Menu
  attr_reader :dish_class, :menu_list

  def initialize(dish_class = Dish)
    @menu_list = []
    @dish_class = dish_class
  end

  def add(dish_name, dish_price)
    dish_entry = @dish_class.new(dish_name, dish_price).dish_entry
    @menu_list << dish_entry
  end

  def print
    @menu_list
  end
end

class Dish
  attr_accessor :dish_entry
  def initialize(dish_name, dish_price)
    @dish_entry = { :dish_name => dish_name, :dish_price => dish_price}
  end
end

# class Order
#   def initialize(menu_class = Menu)
#     @menu_class = menu_class
#     @ordered_dishes = []
#   end

#   def add(dish_name)
#     @menu_list[:dish_name]
#     @ordered_dishes << dish_name
#   end
  
  # def dish_lookup
  #   # a method to lookup the prices of each ordered dish within the menu array.
  #   # maybe the ordered dish names could be put into an array
  #   # and then we can iterate over the array to find the prices
  #   # and those to a separate array.
  #   # In order to get an order summary with prices the dish names array and price array would need to be mapped together.
  #   @menu_list[:dish_name]
  #   @menu_list.values_at(ordered_dish)
  # end

  # def total_price
  #   # a method to work out the total order price
  # end
# 
# end


# irb commands...
#
# require './docs/takeaway_menu'
# menu = Menu.new
# menu.add("burger", 10)
# menu.add("chips", 5)
# menu.add("drink", 2)
# menu.print