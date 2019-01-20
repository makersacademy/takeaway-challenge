require_relative 'menu'

class Order
  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail "There is no #{dish}" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    ordered_totals.inject(:+)
  end

  private

  def ordered_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end
