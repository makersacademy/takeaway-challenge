require_relative "menu"

class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @menu =  menu
    @dishes = {}

  end

  def add(dish, qty)
    raise "Item is not on the menu" unless menu.has_dish?(dish)
    dishes[dish] = qty
  end

  def total
    dishes.map do |dish, qty|
      menu.price(dish) * qty
    end.inject(:+)
  end


end
