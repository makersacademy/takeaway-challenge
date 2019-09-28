class Order
  attr_reader :order

  def initialize(dish, quantity, price)
    @dish = dish
    @quantity = quantity
    @price = price
  end

  def print_order
    @order = "#{@quantity} #{@dish} added to your basket"
    puts @order
  end

  def order_price
    @price * @quantity
  end
end
