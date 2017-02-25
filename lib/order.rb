class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, amount)
    dishes[dish] = amount
  end

  def total
    dish_totals.inject(:+)
  end

  private

  def dish_totals
    dishes.map do |dish, amount|
      menu.price(dish) * amount
    end
  end
end
