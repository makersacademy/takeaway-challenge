class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def select_dish(dish)
    @items << dish
  end
end
