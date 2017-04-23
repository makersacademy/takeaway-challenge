require 'CSV'
require_relative 'list_item'

class List

  attr_reader :menu_items

  def initialize(menu_data)
    @menu_items = []
    @line_width = 80
    @column_width = 40
    load_menu_data_from_csv(menu_data)
  end

  def print_menu
    print_header
    print_menu_items
    print_footer
  end

  def names_of_items
    menu_items.collect { |menu_item| menu_item.name }
  end

  private

  attr_writer :menu_items
  attr_reader :line_width, :column_width

  def load_menu_data_from_csv(file)
    CSV.foreach(file) { |row| build_menu_item(row) }
  end

  def build_menu_item(row)
    name = row[0]
    price = row[1]
    menu_items << ListItem.new({ name: name.to_s, price: price.to_i })
  end

  def print_header
    puts "Menu Items".upcase.center(line_width)
    print "\n"
    print "-" * line_width
    print "\n"
  end

  def print_menu_items
    menu_items.each do |item|
      print item.name.ljust(column_width)
      print item.price.to_s.rjust(column_width)
      print "\n"
    end
  end

  def print_footer
    puts "-" * line_width
  end

end
