require_relative "dish"
require_relative "menu"

class Order

  attr_reader :current_order, :product, :menu

  def initialize(product = Dish, menu = Menu)
    @current_order = []
    @product = product
    @menu = menu.new
  end

  def select_product(product_number)
    if product_in_order?(product_number)
      current_order[get_index].quantity_plus_one
    else
      selected_product = product.new(product_number)
      add_product_to_order(selected_product)
    end
  end

  def product_in_order?(product_number)
    current_order.each do |product|
      return true if product.number == product_number
    end
  end

  def get_index
    i = 0
    current_order.each do |product|
      return i if product.number == product_number
      i += 1
    end
  end

  def add_product_to_order(selected_product)
    @current_order << selected_product
  end

end
