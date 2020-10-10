class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def order_item(menu_item, quantity)
    quantity.times { @items.push(menu_item) }
  end

  def total_price
    total_price = 0
    @items.each { |item| total_price += item.price
    }
    total_price
  end

end
