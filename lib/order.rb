class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_to_order(dish)
    @items << { :dish => dish, :quantity => 1 }
  end
end
