require 'CSV'
class Menu #understands the food items on the menu
  def initialize
    @dishes = {"Bangers & Mash" => {price: 6.99, available: 9}, #load from csv?
              "Chicken Tika" => {price: 7.99, available: 8},
              "Chili Con Carne" => {price: 9.49, available: 9},
              "Dish 4" => {price: 2.99, available: 0},
              "Dish 5" => {price: 6.99, available: 0},
              "Dish 6" => {price: 4.99, available: 9}}
  end

  def dish_price(dish)
    dishes[dish][:price]
  end

  def dish_quantity(dish)
    dishes[dish][:available]
  end

  def dish_available?(dish)
    dishes[dish][:available] != 0 ? true : false #in ruby 0 == true : (
  end

  private
  
  attr_reader :dishes
end
