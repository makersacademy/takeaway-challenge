require_relative 'dish'

class Basket
attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def total
    @dishes.inject(0) {|t, d| t += d.price.to_i}.to_s.insert(-3, '.')
  end
end
