class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def order_item(menu_item, quantity)
    quantity.times { @order.push(menu_item) }
  end

  def total_price
    total_price = 0
    @order.each { |item| total_price += item.price
    }
    total_price
  end

end
