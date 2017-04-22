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

  def select_items(user_input)
    check_input_formatting(user_input)
    check_items_are_on_menu(user_input)
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

  def check_input_formatting(user_input)
    user_input = user_input.split(/, /)
    user_input[0..-2].each { |menu_item| raise RuntimeError, "Input formatted incorrectly" unless /[A-Za-z ]+ x\d+/.match(menu_item) }
    raise RuntimeError, "Input formatted incorrectly" unless /\A\$\d+/.match(user_input[-1])
  end

  def check_items_are_on_menu(user_input)
    user_input = user_input.split(/, /)
    item_names = user_input[0..-2].collect { |menu_item| menu_item.match(/([A-Za-z ]+(?= x\d+))/); $1 }
    menu_names = menu_items.collect { |menu_item| menu_item.name }
    item_names.each { |name| raise RuntimeError, "Item entered that is not listed on menu" unless menu_names.include?(name) }
  end 

end
