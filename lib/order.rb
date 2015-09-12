class Order

  attr_accessor :contents :total_price

  def initialize(total_price = 0.00)
    @contents = []
    @total_price = total_price
  end

  def add_item(dish, quantity)
    @contents << dish
    @contents << quantity
  end

  def order_total(total_price)
    @



end
