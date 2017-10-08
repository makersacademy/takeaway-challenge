class Order
  attr_reader :items

  def initialize(items = Array.new)
    @items = items
  end

  def add_dish(dish)
    @items << dish
  end

  def total
    total = 0
    @items.each { |dish|
      total += dish.price
    }
    total
  end

end
