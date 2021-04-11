class Basket
  attr_reader :meals

  def initialize
    @meals = {}
  end

  def add(name, quantity)
    @meals[name] = quantity
  end
end
