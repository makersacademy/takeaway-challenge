require_relative "menu"

class Order
  attr_reader :dishes

  def initialize(menu = Menu.new(dishes))
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    # fail "#{dish.capitalize} not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  def show
    dishes.map do |dish, quantity|
      p "#{dish} : " + quantity.to_s
    end
  end

  private

  attr_reader :menu

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end
