class Order
  attr_reader :menu, :order_items

  def initialize(menu)
    @menu = menu
    @order_items = Hash.new
  end

  def add_item(name, quantity)
    new_item = nil

    new_item = menu.items.detect { |item| item.name == name }
    @order_items[new_item].nil? ? @order_items[new_item] = quantity : @order_items[new_item] += quantity
  end
end
