class Order

attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish, price, amount)
    basket << { dish: dish, unit_price: price, amount: amount, selection_price: price*amount }
  end

  def 
end
