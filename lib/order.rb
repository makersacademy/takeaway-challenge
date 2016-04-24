class Order

  def initialize
    @list = Hash.new(0)
  end

  def add_to_order(dish, quantity = 1)
    @list[dish] += quantity
  end

  def show_order
    @list.clone
  end

end