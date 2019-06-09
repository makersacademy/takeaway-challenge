require_relative 'menu_entry'
require_relative 'menu'

class Order

  attr_reader :order_selection

  def initialize
    @order_selection = []
  end

  def selection(dish, quantity)
  #  fail 'Dish not available' if dish.not_included_in_menu?
    @order_selection << { dish: dish, quantity: quantity }
  end

  # def total_cost
  #
  # end

# private

  # def not_included_in_menu?
  #   @menu.each do |entry|
  #     entry.each do |dish, price|
  #       !entry.has_key?(dish.to_sym)
  #     end
  #   end
  # end
end
