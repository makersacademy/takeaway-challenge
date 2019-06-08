 require_relative 'item'
 require_relative 'items_array_printer'

class Menu

  def initialize(item = Item)
    @item = item
    @items = []
  end

  def add_item(name, price)
    @items << create_new_item(name, price)
  end

  def print_menu(items_array_printer = ItemsArrayPrinter)
    items_array_printer.to_string(all_objects)
  end

  def get(item)
    @items.each do |hash|
      hash.each do |key, value|
        return value if key == item
      end
    end
  end

  private

  def all_objects
    @items.map{ |item| item.values }.flatten
  end

  def create_new_item(name, price)
    { name => @item.new(name, price) }
  end

end
