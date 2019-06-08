#require_relative 'item'

class Menu

  def initialize(item = Item)
    @item = item
    @items = []
  end

  def add_item(name, price)
    @items << @item.new(name, price)
  end


end
