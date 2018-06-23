class Basket
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish, amount)
    amount.times do @dishes << dish end
  end
end
