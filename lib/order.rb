class Order

  def initialize
    @meal = []
  end

  attr_reader :meal

  def select(dish)
    @meal << dish
  end

  def total
    @total = 0
    @meal.each do |dish|
      @total += dish.price
    end
    @total
  end

end
