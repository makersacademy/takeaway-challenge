class Menu
  attr_reader :food

  def initialize(food)
    @food = food
  end

  def print_menu
    x = food.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end
    x.join(", ")
  end

  def has_food?(choice)
    food.key?(choice)
  end

  def price(choice)
    food[choice]
  end

end
