require_relative "restaurant"

class Order
  attr_accessor :list

  def initialize
    @list = []
  end

  def add(food)
    @list.push(food)
  end
end
