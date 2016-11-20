require_relative "dish"

#manages the amount of a dish
class MenuItem
  DEFAULT_AMOUNT = 1

  attr_accessor :dish, :amount

  def initialize(dish_klass, amount = DEFAULT_AMOUNT)
    @dish = dish_klass
    @amount = amount
  end

  def available?
    amount > 0
  end

end
