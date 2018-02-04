require_relative "dish"

class Menu

  attr_reader :product, :menu_of_products, :product_list

  def initialize(product_list = Dish::FOOD_MENU, product = Dish)
    @product = product
    @product_list = product_list
    @menu_of_products = []
    populate_menu
  end

  def print_menu
    menu_of_products.each { |product| puts product.info }
  end

  private

  def populate_menu
    number_of_products.times do |i|
      @menu_of_products << product.new(i + 1)
    end
  end

  def number_of_products
    product_list.count
  end

end
