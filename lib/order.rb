class Order
  
  attr_reader :dishes
  
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end
  
  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not on the menu!" unless @menu.has_dish?(dish)
    dishes[dish] = quantity
  end
  
  def total
    item_totals.reduce(:+)
  end

  private

  def item_totals
    dishes.map { |dish, quantity| @menu.price(dish) * quantity}
  end
end

class NoItemError < StandardError; end