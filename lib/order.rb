require_relative 'menu'
require_relative 'dish_printer'

class Order

  include DishPrinter

  attr_reader :ordered_items, :menu, :total

  def initialize(menu)
    @ordered_items = []
    @menu = menu
    @total = 0
  end

  # add(dish_name, quantity = 1)

  def add_item(dish, quantity = 1)
    raise 'Item is not on a menu' if not_available?(dish.name)

    ordered_items << {dish: dish.name, price: dish.price, quantity: quantity}
  end

  def show
    print_order(ordered_items)
    print_total(calc_total)
  end

  def calc_total
    ordered_items.each do |item|
      @total += item[:price] * item[:quantity]
    end
    @total
  end
  # if dish already ordered, ordering again would update the quantity
  # print
  # remove(dish)



  def not_available?(dish_name)
    menu.available_dishes.each do |dish| 
      return false if dish.name == dish_name
    end
    true
  end

end