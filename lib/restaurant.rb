class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
  end

  def show_menu
    menu.print_menu
  end

  def order_dish(dish:, quantity:)
    order.store(dish,quantity)
  end

end
