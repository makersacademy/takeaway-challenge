class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end
  
  def add(dish, quantity)
    fail "#{dish.capitalize} is not on the menu." unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  private

  attr_reader :menu
end

