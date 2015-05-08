class Dish
  attr_reader :order_code, :description, :price
  def initialize order_code, description, price
    @order_code = order_code.to_sym
    @description = description
    @price = price
  end
end