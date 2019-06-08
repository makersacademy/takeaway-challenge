# require_relative 'item'

class Menu

  def initialize(item = Item)
    @menu
    @item = item
    @items = []
  end

  def add_item(name, price)
    all << create_new_item(name, price)
  end
  
  def print_menu(items_array_printer = ItemsArrayPrinter)
    items_array_printer.to_string(all)
  end

  private

  def all
    @items
  end

  def create_new_item(name, price)
    { name => @item.new(name, price) }
  end

end
