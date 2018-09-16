require 'pry'
class Order
  attr_reader :dishes, :menu_class

  def initialize(menu_class)
    @dishes = {}
    @menu_class = menu_class
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

  def total
    total_items.inject(:+)
  end

  def total_items
    dishes.map do |dish, quantity|
      menu_class.price(dish) * quantity
    end
  end
end
