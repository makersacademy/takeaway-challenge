require_relative 'menu'
require_relative 'order'
require_relative 'item'

class Takeaway
  attr_reader :menu

  def initialize(restaurant_menu)
    @menu = restaurant_menu
  end

  def print_menu
    menu.print_menu
  end
end

item1 = Item.new("chicken", 2.99)
item2 = Item.new("beef", 3.49)
menu = Menu.new()
menu.add_item(item1)
menu.add_item(item2)
takeaway = Takeaway.new(menu)
order = Order.new(menu)
order.add(item1, 3)

order.total


order.add(item2, 5)
