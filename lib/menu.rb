require_relative 'dish'
require 'csv'

class Menu

  def initialize(item_class)
    @items = []
    @item_class = item_class
    load_items
  end

  def print_menu
    @items.map.with_index {|item,index| "#{index +1}. #{print_item(item)}"}
  end

  def items
    @items
  end

  def print_item(item)
    "#{item.name}: £#{item.price}"
  end

  def load_items
    clear_items
    CSV.foreach(File.path(load_path)) do |row|
      add(@item_class.new(name: row[0], price: row[1]))
    end
  end

  def add(item)
    @items << item
  end

  def clear_items
    @items = []
  end

  def load_path
    File.expand_path("../../assets/menu.csv", __FILE__)

  end

end
