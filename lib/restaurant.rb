class Restaurant

  def initialize()
    @menu = write_menu()
  end

  def show_menu
    @menu.menu
  end

  def create_order
    @current_order = Order.new(@menu)
  end

  def add_dish_to_order(dish)
    @current_order.add_dish(dish)
  end

  def show_order
    show = @current_order.order
    show << {'Sum' => @current_order.calc_sum}
    return show
  end
  
  private
  # initiate dummy menu
  def write_menu
    menu = Menu.new()
    menu.add_dish('Chips', 6.40)
    menu.add_dish('Fish', 8.0)
    menu.add_dish('Beer', 3.20)
    menu.add_dish('Milk', 1.00)
    return menu
  end

end
