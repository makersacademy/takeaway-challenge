class Restaurant
  attr_reader :menu

  def initialize(menu = Menu.new(Array.new))
    @menu = menu
  end

  def show_menu
    menu.print_menu
  end

  def order_dish dish_name
    fail("Sorry, we don't have that dish!") unless menu.includes?(dish_name)
    puts "Order placed!"
  end

end
