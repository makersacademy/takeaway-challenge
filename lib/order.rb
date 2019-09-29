require_relative 'menu'
require_relative 'dish_printer'

class Order

  include DishPrinter

  attr_reader :ordered_items, :menu

  def initialize(menu = Menu.new)
    @ordered_items = []
    @menu = menu
  end

  def add_item(dish_name, quantity = 1)
    raise 'Item is not on a menu' if not_available?(dish_name)
    price = find_price(dish_name)
    ordered_items << { name: dish_name, price: price, quantity: quantity }
  end

  def show
    print_order(ordered_items)
  end

  def show_total
    print_total(calc_total)
  end

  def calc_total
    total = 0
    ordered_items.each do |item|
      total += item[:price] * item[:quantity]
    end
    total
  end

  def not_available?(dish_name)
    menu.available_dishes.each do |dish| 
      return false if dish[:name] == dish_name
    end
    true
  end

  def find_price(dish_name)
    menu.available_dishes.each do |dish| 
      return dish[:price] if dish[:name] == dish_name
    end
  end
end
