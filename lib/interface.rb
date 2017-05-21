class Interface

  attr_reader :printer

  def initialize(restaurant)
    @restaurant = restaurant
    @printer = Printer.new(restaurant)
  end

  def interactive_menu
    loop do
      print_interactive_menu
      process(selection)
    end
  end

  def print_interactive_menu
    printer.interactive_menu
  end

  def process(selection)
    case selection
    when '1'
      printer.print_menu
    end
  end

end
