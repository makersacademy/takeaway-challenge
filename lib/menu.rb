class Menu

  # create attr_reader to pass method
  attr_reader :list_of_dishes

  def initialize(list_of_dishes)
    @list_of_dishes = list_of_dishes
  end

  def print
    list_of_dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
      # with 2. float [ name of dish string capitalized, then price ]
    end.join(", ") # join array with comma, method chaining
  end

  def dish_available?(dish)
    !list_of_dishes[dish].nil? # returns true if dish is not nil
  end

  def price(dish)
    list_of_dishes[dish]
  end
end