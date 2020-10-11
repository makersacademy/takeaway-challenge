class Restaurant
  attr_accessor :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.prettify_menu_list
  end

  def place_order(meal, quantity = 1)
    @order.order(meal, quantity)
  end

end
