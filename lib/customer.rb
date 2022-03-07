require_relative 'order'
require_relative 'food'
require_relative 'menu'

class Customer

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def order_contents
    return @order
  end

  def add_item(name)
    thing_to_add = find_item(name)
    @order.add_to_order(thing_to_add)
  end

  def show_menu
    @menu.show_dishes
  end

  def confirm_order
    text_confirmation
  end

   private

  def find_item(item)
    @menu.find_item(item)
  end

  def text_confirmation
    return "test confirmation"
  end

end
