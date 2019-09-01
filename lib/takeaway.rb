require './lib/menu'
# require './lib/order'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end 

  def read_menu
    @menu.show_menu
  end

  def add_to_order(item, quantity)
    order = Order.new
    order.add(item, quantity)
  end
end 
