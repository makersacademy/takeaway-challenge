class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish)
    @basket << dish
  end

end
