class Order

  attr_reader :items

  def initialize
    @items = []
    @total_price = 0
  end

  def order_item(menu_item, quantity)
    quantity.times { @items.push(menu_item) }
  end

  def total_price
    items.map { |item| item.price }.reduce { |sum, price| sum + price }
  end

end
