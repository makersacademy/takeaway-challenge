require_relative "dish.rb"
#
class OrderItem

  attr_reader :dish, :amount
  DEFAULT_AMOUNT = 1

  def initialize(dish, amount = DEFAULT_AMOUNT)
    @dish = dish
    @amount = amount
  end

end
