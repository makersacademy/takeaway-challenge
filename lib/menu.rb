class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |dish,price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

  def does_not_contain?(dish)
    !list[dish]
  end

end
