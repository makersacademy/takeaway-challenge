require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add(dish, quantity)
    raise "#{dish.capitalize} is not on our menu, please select another item." unless menu.dish_available?(dish)
    basket[dish] = quantity
  end

  def total
    sum = 0
    basket.each { |dish, quantity| sum += menu.price(dish) * quantity }
    sum
  end

end
