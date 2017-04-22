require 'CSV'
require_relative 'list_item'
$line_width = 80
$column_width = 40
class List

  def initialize
    @menu_items = []
  end

  def view_items(file="takeawaylist.csv")
    reset_menu_items
    load_csv(file)
    print_menu
  end

  def select_items
    print_input_instructions
    collect_input
    check_input_formatting
  end

  private

  attr_accessor :menu_items, :user_input

  def load_csv(file)
    CSV.foreach(file) { |row| build_menu_item(row) }
  end

  def build_menu_item(row)
    name = row[0]
    price = row[1]
    menu_items << ListItem.new({name: name, price: price})
  end

  def reset_menu_items
    self.menu_items = []
  end

  def print_menu
    print_header
    print_menu_items
    print_footer
  end

  def print_header
    puts "Menu Items".upcase.center($line_width)
    print "\n"
    print ("-" * $line_width)
    print "\n"
  end

  def print_menu_items
    menu_items.each do |item|
      print item.name.capitalize.ljust($column_width)
      print item.price.to_s.rjust($column_width)
      print "\n"
    end
  end

  def print_footer
    puts ("-" * $line_width)
  end

  def print_input_instructions
    puts "Please input your order in the following format:"
    puts "(item_name ) x(number), (item2_name) x(number), $(total_price)"
    puts "e.g. to order two Margheritas and three Trois fromages, please input:"
    puts "Margherita x2, Trois fromages x3, $36"
  end

  def collect_input
    self.user_input = $stdin.gets.chomp
  end

  def check_input_formatting
    user_input = user_input.split(/, /)
    user_input[0..-2].each { |menu_item| raise_error "Error: Input formatted incorrectly" unless /[A-Za-z]+ x\d+/.match(menu_item) }
    raise_error "Error: Input formatted incorrectly" unless /\$\d+/.match(user_input[-1])

  end

end
