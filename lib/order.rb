require_relative "dish"

class Order

  attr_reader :current_order, :dish

  def initialize(product = Dish)
    @current_order = []
    @product = product
  end

  def select_product(product_number)
    selected_product = product.new(product_number)
    @current_order << selected_product
    selected_product
  end

end
