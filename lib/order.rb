class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, number)
    fail "#{dish.capitalize} is not on the menu" unless menu.available?(dish)
    dishes[dish] = number
  end

  def total
    item_totals.inject(:+)
  end

  def item_totals
    dishes.map do |dish, number|
      menu.price(dish) * number
    end
  end

end
