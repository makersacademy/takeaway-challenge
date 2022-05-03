class Order
  attr_reader :dishes, :state

  def initialize
    @dishes = []
  end
  
  def add(dish)
    dishes << dish
  end

  def remove(dish)
    dishes.delete(dish)
  end

  def total
    total = 0
    dishes.each { |x| total += x.price }
    total
  end

  def place
    if dishes.empty?
      "Sorry, you have no items in your basket. Please add at least one before placing an order."
    else
      "Thank you! Your order was placed and will be delivered soon."
    end
  end
end
