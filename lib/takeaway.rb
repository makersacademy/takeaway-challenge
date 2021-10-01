class Takeaway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def list_menu
    menu.list
  end
end

# class Menu
#   attr_reader :dish, :price

#   def initialize(dish, price)
#     @dish = dish
#     @price = price
#   end
# end
# class TakeAway
#   attr_reader :menu

#   def initialize(menu)
#     @menu = menu
#   end

#   def view_list
#     @menu = "Fries: £20.00"
#   end
# end
