require_relative 'menu'

class Order

  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(dish, quantity)
    fail "Not on the menu" if menu.does_not_contain?(dish)
    increase_basket(dish, quantity)
  end

  def total
    total = 0
      basket.each do |dish,quantity|
        total += quantity * menu.list[dish]
      end
    total
  end

  private

  attr_reader :menu

  def increase_basket(dish, quantity)
    basket[dish] = (basket[dish] ? basket[dish] : 0) + quantity
  end

end
