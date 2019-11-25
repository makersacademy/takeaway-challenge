class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_item(food_item)
    @order << food_item
  end
end