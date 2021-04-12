class Menu
  attr_reader :dishes

  def initialize
  @dishes = {
    Pizza: 10,
      Burger: 5,
      Fish: 1
    }
end

def print
  @dishes.map do |dish, price|
    "%s £%.2f" % [dish.to_s.capitalize, price]
  end.join(", ")
end

def has_dish?(dish)
  dishes.include?(dish)
end


end