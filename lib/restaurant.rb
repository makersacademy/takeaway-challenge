# Understands the dishes available at a restaurant

class Restaurant

  attr_reader :dishes

  DISHES = [
  { "Chicken Tikka" => 8.99 },
  { "Dry Meat" => 10.99 },
  { "Mixed Grill" => 14.99 },
  { "Chana Dal" => 7.99 },
  { "Peshwari Naan" => 3.99 },
  { "Garlic Naan" => 3.49 },
  { "Plain Rice" => 2.99 }]

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

end
