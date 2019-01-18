class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish)
    @basket << dish
  end

  def current_total
    total = 0
    @basket.each { |dish| total += dish.price }
    total
  end

end
