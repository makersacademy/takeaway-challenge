class Order
  attr_reader :menu, :order_items

  def initialize(menu)
    @menu = menu
  end

  def add_item(name, quantity)
  end
end
