require 'menu'
# in this, 'order' means 'this is my order' rather than 'to order'
class Order
  attr_accessor :basket, :menu, :tally

  def initialize
    @basket = []
    @menu = Menu.new
    @tally = 0
  end

  def add_items(number, quantity = 1)
    quantity.times { @basket << @menu.items.keys[number - 1] }
    quantity.times { @tally += @menu.items.values[number] }
  end

end
#
#
#
#   def menu
#     @Menu
#   end
#
#
# end
