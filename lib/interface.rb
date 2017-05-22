class Interface

  attr_reader :printer, :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
    @printer = Printer.new(restaurant)
  end

  def interactive_menu
    loop do
      print_interactive_menu
      process(selection = STDIN.gets.chomp)
    end
  end

  def print_interactive_menu
    printer.interactive_menu
  end

  def process(selection)
    case selection
    when '1'
      printer.print_menu
    when '2'
      printer.input_item_selection
      item_selection = STDIN.gets.chomp.to_i
      printer.input_quantity
      cart.select_item(@restaurant.menu.items[item_selection - 1])
    end
  end

end
