class Interface

  attr_reader :printer, :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
    @printer = Printer.new(restaurant)
  end

  def interactive_menu
    loop do
      printer.interactive_menu
      process(selection = STDIN.gets.chomp)
    end
  end

  def process(selection)
    case selection
    when '1' then printer.print_menu
    when '2' then restaurant.takeaway.add_item_to_cart
    when '3' then restaurant.takeaway.checkout
    when '4' then restaurant.takeaway.confirm
    when '9' then exit
    end
  end

end
