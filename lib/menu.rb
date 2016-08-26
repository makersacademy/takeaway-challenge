class Menu
  def initialize
    @dishes = {"Bangers & Mash" => {price: 6.99, available: 9}, #load from csv?
              "Chicken Tika" => {price: 7.99, available: 9},
              "Chili Con Carne" => {price: 9.49, available: 9}
              "Dish 4" => {price: 2.99, available: 9},
              "Dish 5" => {price: 6.99, available: 9},
              "Dish 6" => {price: 4.99, available: 9}}
  end

  def dish_price(dish)
    @dishes[dish]
  end

  def print_menu
    @dishes.each do |dish, price|
      puts "£#{price}  #{dish}"
    end
  end

  def
end
