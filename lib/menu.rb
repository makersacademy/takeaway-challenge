require_relative 'basket'

class Menu

  attr_reader :basket

  MENU_LIST = [
    { :kebab => 5 },
    { :curry => 6 },
    { :pizza => 4 },
    { :sushi => 8 },
    { :burrito => 6 }
  ]

  def initialize
    @basket = []
  end

  def view_menu
    MENU_LIST.each { |item| item.each { |key, value| puts "#{key}, £#{value}" }}
  end

  def add_to_basket(dish_number, quantity)
    quantity.times do @basket << MENU_LIST[dish_number - 1]
    end
  end
end
