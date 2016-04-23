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

end
