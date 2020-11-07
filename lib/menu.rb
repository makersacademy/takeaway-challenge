class Menu

  DISHES = {
    "Soup of the day" => 5,
    "Salad" => 6,
    "Burger" => 9,
    "Fish and chips" => 11,
    "Chicken pie" => 11,
    "Sausage and mash" => 10,
    "Apple crumble" => 6,
    "Sticky toffee pudding" => 6
  }

  attr_reader :dishes

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def view
    @dishes.each { |dish, cost| puts "#{dish}, £#{cost}" }
  end

end
