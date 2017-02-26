require_relative 'make_order'

class Menu

  attr_reader :pizza_menu, :order, :order_cost, :quantity

  def initialize
    @pizza_menu = {
      'Margeritta' => 10,
      'Pepperoni' => 12,
      'Ham' => 11,
      'Meat' => 14,
      'Vegetarian' => 11,
      'Fish' => 14,
      'Spicy' => 13
      }
  end

  def display_menu
    @pizza_menu.each { |k,v| puts "#{k} |£#{v}|" }
  end
end
