class Order
  attr_reader :dishes, :menu
  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish,quantity)
    fail "This is not on the menu!" unless menu.include_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    dish_total
  end

  private

  def dish_total
   total = dishes.map do |dish, quantity|
    menu.price(dish) * quantity
    end
    total.reduce(0, :+)
  end

end
