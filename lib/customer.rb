require_relative 'menu.rb'

class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu.dishes
  end

  def display_menu
   menu.each { |key, value| "#{key}, £#{value}" }
  end

  def place_order(dish, quantity)
    fail "This dish is not on the menu" unless menu.has_key?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end
  #
  # def view_price
  #   selected_dishes.each_value do |price|
  #     @total += price if total == 0
  #     @total
  #   end
  # end




end
