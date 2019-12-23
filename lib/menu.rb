require_relative 'item'

class Menu
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_item(item, name, price)
    item = item.new(name, price)
    @items[item.name] = item.price
  end

end
