# require_relative 'item'

class Menu
  attr_reader :items

  def initialize(item = Item)
    @item = item
    @items = []
  end

  def add_item(name, price)
    @items << create_new_item(name, price)
  end

  private

  def create_new_item(name, price)
    { name => @item.new(name, price) }
  end
  
end
