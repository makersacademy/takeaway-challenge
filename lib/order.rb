class Order
  attr_reader :total, :items
  
  def initialize
    @total = 0
    @items = []
  end

  def add(dish)
    @items << "#{dish.name} = £#{dish.price}"
    @total += dish.price
  end

end
