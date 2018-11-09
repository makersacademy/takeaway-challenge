class Order

  def initialize
    @dishes = Dishes.new
    @food_ordered = []
  end

  def order_food(ordered_food, quantity)

    quantity.times { @food_ordered << @dishes.dishes[ordered_food] }
    return "#{ordered_food} ordered x #{quantity}"
  end

  def bill
    puts @food_ordered.sum
    return "The bill is £#{@food_ordered.sum}"
  end

end
