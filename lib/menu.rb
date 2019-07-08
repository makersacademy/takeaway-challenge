class Menu

  attr_reader :food

  def initialize(food)
    @food = food
  end

  def print_list
    food.map do |name, price|
      "%s: £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")

  end
end
