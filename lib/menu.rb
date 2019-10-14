class Menu
  attr_reader :foods
  def initialize(foods)
    @foods = foods || {pizza: 2, fries: 2, burger: 3, milkshake: 4, chicken: 6}
  end

  def print_menu
    foods.map do |title, price|
      "%s £%.2f" % [title.to_s, price]
    end.join(", ")
  end

  def price(food)
    foods[food]
  end

  def has_food?(food)
    !foods[food].nil?
  end
end
