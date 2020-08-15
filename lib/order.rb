require_relative 'menu'

class Order

  include Menu
  attr_accessor :customer_order

  def initialize
    @customer_order = {}
  end

  def show_menu
    DISHES.map { |name, price| puts "#{name} - £#{price}" }
  end

  def add_dish
    @customer_order[@dish] = @quantity
  end

  def customer_selection(dish, quantity)
    @dish = dish
    @quantity = quantity
    return add_dish if DISHES.keys.include? @dish
  end

  def price_of_order
  end

end
