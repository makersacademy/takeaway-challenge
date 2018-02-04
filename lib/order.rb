require_relative "dish"
require_relative "menu"

class Order

  attr_reader :current_order, :product, :menu

  def initialize(product = Dish, menu = Menu)
    @current_order = []
    @product = product

  end

  def select_product(product_number)
    product_already_in_order(product_number)
  end

  def product_already_in_order(product_number)
    current_order.each do |product|
      return product.quantity_plus_one if product.number == product_number
    end
    selected_product = product.new(product_number)
    add_product_to_order(selected_product)
  end

  def add_product_to_order(selected_product)
    @current_order << selected_product
  end

end
