require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_reader :dishes 

  def initialize(menu)
    @dishes = {} 
    @menu = menu
  end

  def add(dish, quantity)
    fail "#{dish} is not available" unless menu.has_dish?(dish)

    @dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end
private

  attr_reader :menu

  def item_totals 
    dishes.map { |dish, quantity| menu.price(dish) * quantity }
  end
end
