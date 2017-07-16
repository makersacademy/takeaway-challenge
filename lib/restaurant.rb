class Restaurant
  attr_reader :menu, :order

  def initialize(menu = Menu.new(Array.new), order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.print_menu
  end

  def take_order(list_of_dishes, amount_tendered)
    check_cost(list_of_dishes, amount_tendered)
    check_menu_includes(list_of_dishes)
    place_order(list_of_dishes)
  end

  private

  def check_cost(list_of_dishes, amount_tendered)
    correct_cost = order.calculate_cost(list_of_dishes)
    fail("EXACT CHANGE PLEASE. Please provide exactly £#{correct_cost}") unless amount_tendered == correct_cost
  end

  def check_menu_includes(list_of_dishes)
    list_of_dishes.each do |requested_dish|
      fail("Sorry, food safety regulations prevent us from serving #{requested_dish.name}!") unless menu.includes?(requested_dish)
    end
  end

end
