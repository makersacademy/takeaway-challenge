require 'csv'
require_relative 'order'
require_relative 'load_menu_module'

class Menu
  include LoadMenu
  def initialize(restaurant: "fishnchips.csv", order: Order.new(restaurant: restaurant))
    @order = order
    load_menu(restaurant)
  end

  def display_menu
    menu_array = []
    @menu_hash.each do |key, value| 
      menu_array << "#{key}: £#{value}"
    end
    menu_array.join("\n")
  end

  def order(dish, quantity, order: @order)
    order.add(dish, quantity)
  end

  def check_order(order: @order)
    order.receipt
  end
end
