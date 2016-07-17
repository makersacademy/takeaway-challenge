class Menu

  DISHES = {
    "Lemon Chicken" => 5,
    "Fried Rice" => 3,
    "Chilli Beef" => 6,
    "10 Hot Wings" => 4
  }.freeze

  def contain?(dish)
    DISHES.key?(dish)
  end

end
