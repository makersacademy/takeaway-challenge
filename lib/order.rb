
class Order

attr_reader :items, :menu
  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add_item(item, quantity)
    raise "Selected item is not on the menu" unless menu.has_item?(item)
    items[item] = quantity
  end

end
