require_relative 'item'

class Menu
  attr_reader :items

  def initialize(item = Item.new)
    @item = item
    @items = {}
  end
  
  def add_item(name, price)
    @items[name] = price
  end

  def delete_item(name)
    @items.delete(name)
  end

  def print_menu
    @items.each do |name, price|
      puts "#{name}, £#{price}"
    end
  end
end
