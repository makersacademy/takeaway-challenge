require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def view_menu
    @menu.show_menu
  end

  def new_order(order = Order)
    @order = order.new
  end

  def add_item(item)
    @order.add_item({ item => @menu.dishes[item] })
  end

  def view_receipt
    @order.display_order
  end
end
