class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def order_item(menu_item, quantity)
    quantity.times { @order.push(menu_item) }
  end
end
