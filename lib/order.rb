# new class 'Order'
class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(food)
    fail "Please enter a valid selection!" unless @menu.menu_items.include?(food)
    @basket << food
  end
end
