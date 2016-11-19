class Takeaway

attr_reader
attr_accessor :menu

  def initialize
    @menu = []
  end

  # def meal_price(price)
  #   price = 1
  # end
  #
  # def new_dish(meal)
  #   @meal = meal
  # end

  def add_meal(meal, price)
    @meal = meal
    @price = price
    meal_description = {:meal => @meal, :price => @price}
    @menu << meal_description
  end


end
