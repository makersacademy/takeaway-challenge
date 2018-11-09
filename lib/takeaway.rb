require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :dishes

  def initialize
    @dishes = []
  end

 def show_menu
   menu = Menu.new
   menu.print
 end
 def select_dish(name,quantity)
   @dishes << {:name => name, :quantity => quantity}
   # @name = name
   # @quantity = quantity
   # order = Order.new(name, quantity)
 end
 def place_order
   @dishes
 end
end
