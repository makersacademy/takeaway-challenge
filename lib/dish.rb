class Dish

  attr_reader :description, :price, :quantity

  def initialize (description, price, quantity)
    @description = description
    @price = price
    @quantity = quantity
  end

  def see
    "#{description} \: \£#{format("%.2f", price)} \: #{quantity}"
  end

end