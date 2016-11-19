require_relative "dish"

#manages the amount of a dish
class MenuItem
  DEFAULT_AMOUNT = 1

  attr_accessor :dish, :amount

  def initialize
    @dish
    @amount
  end

  def add(dish, amount = DEFAULT_AMOUNT)
    self.dish = dish
    self.amount = amount
  end

  def available?
    amount > 0
  end

end
