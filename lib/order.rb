
class Order

attr_reader :items, :menu
  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add_item(item, quantity)
    items[item] = quantity
  end

end
