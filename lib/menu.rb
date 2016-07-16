class Menu

attr_reader :food

  def initialize(food)
    @food = food
  end

  def print_list
    food.map {|item, price| "%s: £%.2f" % [item.to_s.capitalize, price]}.join(", ")
  end

end
