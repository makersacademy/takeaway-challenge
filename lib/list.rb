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
  end

  private

  attr_accessor :menu_items

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

end
