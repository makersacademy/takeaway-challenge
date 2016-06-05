# Order functionality: stores a customer's order
class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemERROR, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+).round(2)
  end

  private

  attr_reader :menu

  def item_totals
    dishes.map { |dish, quantity| menu.price(dish) * quantity }
  end

end

class NoItemERROR < StandardError; end
