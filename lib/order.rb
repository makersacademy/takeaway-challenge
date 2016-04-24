class Order

  def initialize
    @list = {}
  end

  def add(dish, quantity)
    @list.store(dish.to_sym, quantity)
  end

  def list
    @list.dup
  end

  def store_cost(sum)
    @list.store(:total_price, sum)
  end

end
