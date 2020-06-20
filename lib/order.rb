class Order

  attr_reader :dishes
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end
  def add(dish, quant)
    fail "Chicken is not on the menu" unless menu.has_dish?(dish)
    dishes[dish] = quant
  end
  def total
    order_total.inject(:*)
  end
  private
  attr_reader :menu
  def order_total
    dishes.map do |dish, quant|
      menu.price(dish) * quant
    end
  end
end
