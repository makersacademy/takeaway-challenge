require_relative 'menu'

class Order

  attr_reader :dishes, :order, :menu

  def initialize
    @menu = Menu::MENU
    @order = {}
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} is not on the menu!" unless has_dish?(dish)
    order[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  def price(dish)
    @menu[dish]
  end

  def item_totals
    order.map do |dish, quantity|
      @menu[dish] * quantity
    end
  end

  def has_dish?(dish)
    !@menu[dish].nil?
  end

end
