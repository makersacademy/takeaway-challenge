class Order
  attr_reader :orders, :price

  def initialize(orders, quantities, price)
    @orders = orders
    @quantities = quantities
    @price = price
  end

  def translate(menu)
    trans = []
    @orders.size.times do |y|
      trans << menu.show_menu.select { |dish| dish.item_id == @orders[y] }
    end
    @orders = trans.flatten
  end

  def correct?
    @orders.zip(@quantities)
    .map { |order, num| order.price * num }.inject(:+) == @price 
  end

end
