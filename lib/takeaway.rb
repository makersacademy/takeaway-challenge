class Takeaway

  attr_reader :order, :menu, :basket, :view_menu

  def initialize(menu_class = Menu, order_class = Order )
    @order = order_class
    @menu = menu_class.new
  end

  def view_menu
    @menu.view
  end

  def place_order
    order
  end

  def view_order
    order.view_order
  end

  def checkout

  end

  def total
  end
  
end




# Responsible for running the ordering process, showing 
# the basket, showing the order total and checking out.