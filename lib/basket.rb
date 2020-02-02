class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(dish)
    @basket << dish
  end

end
