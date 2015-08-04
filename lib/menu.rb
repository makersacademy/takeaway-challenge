require 'terminal-table'

class Menu

  attr_reader :items

  def initialize
    @items = { pizza: 10,
              lasagne: 8,
              omlette: 4 }
  end

  def list
    items.keys
  end

  def price food_item
    items[ food_item ]
  end

  def display_menu
    table = Terminal::Table.new rows: items.map{|items,price|[items, price]}
    puts table
  end

  def check_inclusion? food_item
    items.keys.include? food_item
  end

end
