class Order
attr_reader :basket, :menu

  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add(meal, quantity)
    raise "Not in the menu!" if !menu.include(meal)
    @basket[meal] = quantity
  end
end
