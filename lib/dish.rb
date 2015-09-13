class Dish

  attr_reader :number, :description, :price
  attr_accessor :quantity

  def initialize(number, description, price, quantity)
    @number = number
    @description = description
    @price = price
    @quantity = quantity
  end

  def see
    "#{number} \: #{description} \: \£#{format("%.2f", price)}"
  end

  def total
    @price * @quantity
  end

end