require_relative "dish"
require_relative "menu"

class Order

  attr_reader :current_order, :product, :menu

  def initialize(product = Dish, menu = Menu)
    @current_order = []
    @product = product
    @menu = menu.new
  end

  def select_product(product_number, quantity = 1)
    if product_in_order?(product_number)
      selected_product = current_order[get_index(product_number)]
      selected_product.add_quantity(quantity)
    else
      selected_product = product.new(product_number, quantity)
      add_product_to_order(selected_product)
    end
    basket_update_message(selected_product, quantity)
  end

  def read_menu
    menu.print_menu
  end

  private

  def basket_update_message(selected_product, quantity)
    puts "#{quantity}x #{selected_product.name}(s) added to basket"
  end

  def product_in_order?(product_number)
    current_order.each do |product|
      return true if product.number == product_number
    end
    false
  end

  def get_index(product_number)
    i = 0
    current_order.each do |product|
      if product.number == product_number
        return i
      end
      i += 1
    end
  end

  def add_product_to_order(selected_product)
    @current_order << selected_product
  end

end
