class Order
  def initialize menu
    @menu = menu
    @order = []
  end

  def add dish, quantity
    quantity.times { @order << dish.name }
  end

  def summary
    @order.clone
  end
end