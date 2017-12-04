# require_relative "restaurant"

class Order
  DEFAULT_AMOUNT = 1
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add(food, amount = DEFAULT_AMOUNT)
    @food, @amount = food, amount
    @amount.times do
      @basket[food] += 1
    end
end
