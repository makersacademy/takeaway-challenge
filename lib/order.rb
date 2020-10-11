class Order
  attr_reader :food

  def initialize(menu)
    @food = {}
    @menu = menu
  end

  def add_order(item, quantity)
    fail "#{item} is not on the menu!" unless menu.avilable_food?(item)
    food[item] = quantity
  end

  private
  attr_reader :menu
end
