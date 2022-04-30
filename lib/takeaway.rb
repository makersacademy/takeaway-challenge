class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new, current_order = Order.new)
    @menu = menu
    @current_order = current_order
  end

  def display_menu
    menu.display_available_dishes
  end

  def add_to_order(dishes)
    current_order.add_to_basket(dishes)
  end

  private

  # attr_writer :current_order
end