require 'menu'

class Restaurant
  attr_reader :order

  # in seconds
  MAXIMUM_WAIT_TIME = 3600

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def design_dish(name, price)
    @menu.add_to_menu(name, price)
  end

  def display_menu
    # check if empty
    @menu.compile_menu
  end

  def display_order
    # check if empty
    @menu.compile_order(@order)
  end

  def add_to_order(name)
    selection = select_dish(name)
    return "No dish found" if selection.empty?
    return "Dish not available" unless selection.first.available

    @order += selection
  end

  def dish_unavailable(name)
    selection = select_dish(name)
    return "No dish found" if selection.empty?

    selection.first.not_available
  end

  def order_complete
    time = Time.now + MAXIMUM_WAIT_TIME
    "Thank you! Your order was placed and " +
    "will be delivered before #{time.hour}:#{time.min}"
  end

  private

  def select_dish(name)
    @menu.dishes.select { |dish| dish.name == name }  
  end

end
