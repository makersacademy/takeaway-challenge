class Takeaway

attr_reader
attr_accessor :menu

  def initialize
    @menu = []
  end

  def meal_price(price)
    price = 1
  end

  def new_dish(meal)
    @meal = meal
  end

end
