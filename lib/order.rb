require_relative '../lib/menu.rb'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def selection(food)
    @basket << food
  end
end
