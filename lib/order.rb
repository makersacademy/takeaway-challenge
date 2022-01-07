class Order

  def initialize
    @meal = []
  end

  attr_reader :meal

  def select(dish)
    @meal << dish
  end

end
