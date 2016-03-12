require_relative 'order'

class Menu

  attr_reader :menu_view

  def initialize(neworder = Order)
    @menu_view = {eggs: 4,bacon: 3,toast: 4}
    @order_class = neworder
  end

  def view_menu
    @menu_view
  end

  def order_item(item)
    @order ||= @order_class.new
    value = menu_view[item]
    @order.new_order(item,value)
  end

end
