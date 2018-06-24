class Order

  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add(food)
    @basket << food
  end

  

end
