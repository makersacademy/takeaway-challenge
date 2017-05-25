
class Display

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_input
    STDIN.gets.chomp
  end

  def display_menu
    puts "#{@menu.extracts_starters} #{@menu.extracts_main_course} #{@menu.extracts_dessert}"
  end

  def print_interactive_menu
    puts "1. Place orders"
    puts "2. Show order selections"
    puts "7. Exit"
  end

  def print_error_message
    puts "I don't know what you mean, try again"
  end

  def print_instructions
    puts "Enter the order numbers you'd like to add to your basket:"
    puts "Remember, to exit select 7 or hit double space twice"
  end

  def print_no_orders
    puts "You have made no orders!"
  end

  def print_order(basket)
    puts "You have 1 order: order number #{basket.join(', ')}"
  end

  def print_orders(basket)
    puts "You have #{basket.count} orders: order numbers #{basket.join(', ')}"
  end

  def print_total(prices, total)
    puts "Thanks for ordering! Your combined orders total: #{prices} which gives a total of £#{total}"
  end

end
