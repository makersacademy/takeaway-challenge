class Restaurant
  def view_menu
    display.view_menu(menu.meals)
  end

  def add(meal)
    choice = meal.downcase.to_sym
    return 'Please make a valid choice' unless menu.meals.include?(choice)
    order << menu.meals.slice(choice)
    display.confirm_added(meal)
  end

  def view_order
    display.view_order(order)
  end

  def place_order
    puts view_order
    display.confirm_order
    order.clear
    customer_service.confirmation_text
  end

  private

  attr_reader :menu, :order, :display, :customer_service

  def initialize(args = {})
    @customer_service = args[:customer_service] || CustomerService.new
    @display          = args[:display]          || Display.new
    @menu             = args[:menu]             || Menu.new
    @order            = []
  end
end
