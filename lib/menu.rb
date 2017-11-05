require 'dish.rb'

# this stores a list of all dishes that can be searched
class Menu
  attr_reader :list

  DISH_MENU = {
    Balti: Dish.new('Balti', 8),
    Bhuna: Dish.new('Bhuna', 7),
    Biryani: Dish.new('Biryani', 9),
    Dhansak: Dish.new('Dhansak', 8),
    Dopiaza: Dish.new('Dopiaza', 6),
    Jalfrezi: Dish.new('Jalfrezi', 7),
    Korai: Dish.new('Korai', 5),
    Korma: Dish.new('Korma', 8),
    Madras: Dish.new('Madras', 7),
    Moghlai: Dish.new('Moghlai', 6),
    Passanda: Dish.new('Passanda', 5),
    Patia: Dish.new('Patia', 8),
    Roganjosh: Dish.new('Rogan Josh', 9),
    Saag: Dish.new('Saag', 4),
    Tikka: Dish.new('Tikka', 5),
    Tikkamasala: Dish.new('Tikka Masala', 4),
    Vindaloo: Dish.new('Vindaloo', 7)
  }

  def initialize
    @list = DISH_MENU
  end

  def search(dish)
    @list[dish.to_s.delete(' ').downcase.capitalize.to_sym]
  end
end
