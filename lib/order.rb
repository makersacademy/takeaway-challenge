class Order

attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish, amount)
    basket << { dish: dish, amount: amount }
  end\
end
