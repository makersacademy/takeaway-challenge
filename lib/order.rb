class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not available to order!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    order_total.inject(:+)
  end

  private

  attr_reader :menu

  def order_total
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end

class NoItemError < StandardError; end
