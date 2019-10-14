require 'menu'
class Order
  attr_accessor :cost, :dishes, :menu
  def initialize(menu)
    @cost = 0
    @dishes = {}
    @menu = menu || Menu.new
  end

  def make_order(choice, quantity)
    fail "#{choice} is not on the menu!" if !menu.has_food?(choice)
    dishes[choice] = quantity
  end

  def total
    cost = totals.inject(:+)
    cost
  end

  private
  def totals
    dishes.map do |choice, quantity|
      menu.price(choice) * quantity
    end
  end
end
