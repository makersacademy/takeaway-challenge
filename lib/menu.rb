require_relative "dish"

class Menu

  attr_reader :product, :menu

  def initialize(product_list = Dish::FOOD_MENU, product = Dish)
    @product = product
    @menu = []
    populate_menu(product_list)
  end

  def print_menu
    puts MENU
  end

  def populate_menu(product_list)
    number_of_products = product_list.count
    number_of_products.times do |i|
      @menu << product.new(i + 1)
    end
  end

end
