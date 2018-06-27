require_relative './menu'
class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def add(dish, qty)
    raise "#{dish.capitalize} is not available" unless menu.on_menu?(dish)
    basket[dish] = qty
  end

  def dish_total
    basket.map do |dish, qty|
      menu.price(dish) * qty
    end
  end

  def total
    balance = 0
    dish_total.each do |price|
      balance += price
    end
    balance
  end
end
