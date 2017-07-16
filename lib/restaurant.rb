class Restaurant
  attr_reader :menu, :takeaway

  def initialize(menu = Menu.new(Array.new), takeaway = Takeaway.new)
    @menu = menu
    @takeaway = takeaway
  end

  def show_menu
    menu.print_menu
  end

  def take_order(list_of_dishes, amount_tendered)
    correct_cost = takeaway.calculate_cost(list_of_dishes)
    fail("EXACT CHANGE PLEASE. Please provide exactly £#{correct_cost}") unless amount_tendered == correct_cost
    check_menu_includes(list_of_dishes)

  end

  private

  def check_menu_includes(list_of_dishes)
    list_of_dishes.each do |requested_dish|
      fail("Sorry, food safety regulations prevent us from serving #{requested_dish.name}!") unless menu.includes?(requested_dish)
    end
  end

end
