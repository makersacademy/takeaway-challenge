#This class is responsible for managing the items in an order
require_relative 'menu'

class Order

  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(dish, quantity)
    increase_basket(dish, quantity)
  end

  def total
    dish_totals.inject(:+)
  end

  private

  attr_reader :menu

  def increase_basket(dish, quantity)
    basket[dish] = (basket[dish] ? basket[dish] : 0) + quantity
  end

  def dish_totals
    basket.map do |dish, quantity|
      quantity * menu.price(dish)
    end
  end

end
