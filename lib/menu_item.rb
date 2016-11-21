require_relative "dish"

#manages the amount of a dish
class MenuItem
  DEFAULT_AMOUNT = 1

  attr_accessor :dish, :amount

  def initialize(name, price, amount = DEFAULT_AMOUNT,  dish_klass = Dish)
    @dish = dish_klass.new(name, price)
    @amount = amount
  end

  def available?
    amount > 0
  end

end
