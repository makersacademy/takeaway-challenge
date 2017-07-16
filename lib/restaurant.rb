class Restaurant
  attr_reader :menu, :cashier, :messager

  def initialize(menu = Menu.new(Array.new), messager = Messager.new)
    @menu = menu
    @cashier = 0
    @messager = messager
  end

  def show_menu
    menu.print_menu
  end

  def take_order(order, amount_tendered)
    check_cost(order, amount_tendered)
    place_order(amount_tendered)
  end

  private

  def check_cost(order, amount_tendered)
    fail("EXACT CHANGE PLEASE. Please provide exactly £#{order.calculate_cost}") unless amount_tendered == order.calculate_cost
  end

  def place_order(amount_tendered)
    @cashier += amount_tendered
    messager.send_confirmation_msg
  end

end
