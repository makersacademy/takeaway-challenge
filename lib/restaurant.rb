

class Restaurant
  def initialize(menu_class:, order_class:)
    @menu = menu_class.new
    @order_class = order_class
  end

  def view_menu
    @menu.view_menu
  end

  def create_order
    @order_class.new
  end
end
