require_relative 'menu'

class Customer

  attr_accessor :menu, :new_order, :menu, :order, :total_items, :order_total

  def initialize
    @menu = Menu.new
    @order = {}
    @order_total = 0
    @total_items = 0
  end

  def receipt
    order.map do |dish, quantity|
      "#{dish} x#{quantity}"
    end.join(", ")
  end

  def display_menu
    menu.menu_list.each { |key, value| puts "#{key} - £#{value}" }
  end

  def select_dish(dish, quantity)
      fail 'Dish not on menu' unless menu.menu_list.has_key?(dish)
      @total_items += quantity
      @order[dish] = quantity
      update_price(dish, quantity)
  end

  private
  
  def update_price(dish, quantity)
    @order_total += menu.menu_list[dish] * quantity
  end
end
