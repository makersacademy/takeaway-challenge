class Ordering

  attr_reader :chosen_dishes
  def initialize(menu) # ref1 knowing about Menu
    @chosen_dishes = {}
    @menu = menu # ref1
  end
  def add(dish, qty)
    fail "We do not have any #{dish.capitalize} in the list" unless menu.dish_available?(dish)
    chosen_dishes[dish] = qty
  end

  def sum
    sum_of_dishes.inject(:+)
  end

  private

  attr_reader :menu

  def sum_of_dishes
    chosen_dishes.map do |dish, qty|
      menu.price(dish) * qty
    end
  end
end