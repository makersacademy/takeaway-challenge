class Order

  attr_reader :order

  def initialize
    @order = {}
  end

  def add item, menu
    @order.merge!(menu.select_food(item.to_s))
  end

  def total
    @order.values.inject {|a, b| a + b }
  end

end
