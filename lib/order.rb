class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = Hash.new(0)
    @menu = menu
  end

  def add(dish, amount)
    fail "#{dish.capitalize} is not on the Menu" unless menu.has_dish?(dish)
    dishes[dish] += amount
  end

  private

  attr_reader :menu

end
