
class Menu

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item_name, item_price)
    item = Item.new(item_name, item_price)
    @items << item
  end

end
