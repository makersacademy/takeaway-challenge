require_relative "dish"

class Menu

  attr_reader :product, :menu

  def initialize(products = Dish::FOOD_MENU, product = Dish)
    @menu = populate_menu(products)
    @product = product
  end

  def print_menu
    puts MENU
  end

  def populate_menu(products)
    number_of_products = products.count
    number_of_products.times do |i|
      Dish.new(i + 1)
    end
  end

end
