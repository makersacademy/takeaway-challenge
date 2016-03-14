require 'bigdecimal'

class Dish
  attr_reader :name, :price
  def initialize(name: nil, price: 0)
    @name = name
    @price = BigDecimal.new(price.to_s)
  end

  def update_price(new_price)
    @price = BigDecimal(new_price.to_s)
  end

  def rename(new_name)
    @name = new_name
  end
end
