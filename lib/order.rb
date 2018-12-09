require_relative "menu"

class Order

  attr_reader :basket, :item, :quantity

  def initialize(menu = Menu.new)
    @basket = []
    @item = item
    @quantity = quantity
  end

  def add_item(item, quantity)
    @item = item
    @quantity = quantity
  end

  def to_basket
    item_cost = @menu_items[@item]
    quantity.times { @basket << item_cost }
  end

end
