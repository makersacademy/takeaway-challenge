class Takeaway
  attr_reader :menu

  def initialize
    @menu = [{:chips => 1.80}, {:burger => 10.00}]
  end

  def menu
    @menu
  end

  def order(order_total, **dish_and_quantity)
  end
end
