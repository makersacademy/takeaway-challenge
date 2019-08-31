require 'set'

class Order
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def valid(menu_dishes)
    fail 'Empty order' if @order.empty?

    menu_dish_names = Set[]
    menu_dishes.each do |dish|
      menu_dish_names.add(dish.name)
    end

    @order.each do |dish|
      fail 'Dish not in menu' if
        !menu_dish_names.include?(dish[:name])
    end
  end
end
