class Dish

  attr_reader :name, :price, :quantity

  def initialize(name = 'Empty', price = 0.0)
    @name = name
    @price = price
    @quantity = 0
  end

  def set_quantity(number)
    number.to_i
    if number < 0
      number = 0
    else
      @quantity = number
    end
  end

  def add
    @quantity += 1
  end

end