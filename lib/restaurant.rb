class Restaurant
  attr_reader :menu, :order

  def initialize(menu = Menu.new(Array.new))
    @menu = menu
  end

  def show_menu
    menu.print_menu
  end

  def take_order(order, amount_tendered)
    @order = order
    check_cost(order, amount_tendered)
  end

  private

  def check_cost(order, amount_tendered)
    fail("EXACT CHANGE PLEASE. Please provide exactly £#{order.calculate_cost}") unless amount_tendered == @order.calculate_cost
  end


end
