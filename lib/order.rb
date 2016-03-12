require_relative "menu"

class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(item, quantity = 1)
    @basket[item] += quantity
  end
end
