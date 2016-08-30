class Menu #understands the food items on the menu
  attr_reader :dishes

  def initialize
    # csv_path = '/Users/James/desktop/makers/takeaway-challenge/resources/Dishes.csv'
    # dishes = CSV.read(csv_path)
    load_dishes
  end

  def load_dishes
    @dishes = {"Bangers & Mash" => 6.99, #load from csv?
              "Chicken Tika" => 7.99,
              "Chili Con Carne" => 9.49,
              "Pizza" => 2.99,
              "Dish 5" => 6.99,
              "Dish 6" => 4.99}
  end

  def dish_price(dish)
    dishes[dish]
  end

  def has_dish?(dish)
    dishes.has_key?(dish)
  end
end
