# require_relative 'item'

class Menu

  def initialize(item = Item)
    @menu
    @item = item
    @items = []
  end

  def add_item(name, price)
    @items << create_new_item(name, price)
  end

  def print_menu(items_array_printer = ItemsArrayPrinter)
    items_array_printer.to_string(all_objects)
  end

  private

  def all_objects
    @items.map{|each|each[:name]}
  end

  def create_new_item(name, price)
    { name: @item.new(name, price) }
  end

end
