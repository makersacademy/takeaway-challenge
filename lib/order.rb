require_relative 'menu'

class Order

  attr_reader :dishes, :menu, :total

  def initialize(menu = Menu.new)
    @dishes = {}
    @menu = menu

  end

  def add_item(dish, quantity)
    raise 'This isnt on the menu' unless menu.on_menu?(dish)
    dishes[dish] = quantity
  end

  def total
    dish_totals.inject(:+)
  end

  def dish_totals
    dishes.map do |dish, quantity|
    menu.price(dish) * quantity
    end
  end
end
