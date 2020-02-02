class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(*dish)
    dish.each { |item| @basket << item }
  end

  def total
    @basket.inject(0) { |total, dish| total + dish.price }
  end

end
