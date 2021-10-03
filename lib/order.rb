require_relative 'menu'

class Order

  attr_reader :dishes_ordered, :menu, :orders, :order_total

  def initialize(menu)
    @dishes_ordered = {}
    @menu = menu
    @order_total = 0
    @orders
  end

  def add_dish_to_order(name, quantity)
    fail 'Unable to place order, the dish is not available' unless menu.dish_available?(name)
    dishes_ordered[name] = quantity
  end

  def list_order
    orders = dishes_ordered.each do |dish, quantity|
      "%s: %02d" % [dish, quantity]
    end
    orders
  end

  def calculate_total(menu)
    @dishes_ordered.each do |dish, quantity|
      @order_total += menu.menu_items[dish] * quantity
    end
    "£%.2f" % [@order_total]
  end
end
