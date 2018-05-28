class Menu
  attr_reader :dish
  def initialize
    @dish = { "Runny Risotto" => 5,
              "No Carbs Carbonara" => 6,
              "Cold Pizza" => 7,
              "Sugarless Tiramisu" => 4,
              "Low Veg Meat Salad" => 3,
              "Warm Wine" => 10,
            }
  end

  def price(dish_key)
    @dish[dish_key]
  end

end
