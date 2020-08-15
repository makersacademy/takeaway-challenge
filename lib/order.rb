require_relative 'menu'

class Order

  include Menu
  attr_accessor :customer_order

  def initialize
    @customer_order = []
  end

  def show_menu
    DISHES.map { |name, price| puts "#{name} - £#{price}" }
  end

  def customer_selection(dish, quantity)

  end


end
