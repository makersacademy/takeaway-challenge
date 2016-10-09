class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display
    dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end
end
