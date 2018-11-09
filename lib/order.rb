class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_to_order(dish, quantity)
    @items << { :dish => dish, :quantity => quantity }
  end
end
