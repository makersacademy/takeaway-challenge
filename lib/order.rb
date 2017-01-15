class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    fail "#{dish.capitalize} not on the menu" unless menu.has_dish?(dish)
    dishes[dish] += quantity
  end

  def total
    dish_sum.inject(:+)
  end

  private

  def dish_sum
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end
