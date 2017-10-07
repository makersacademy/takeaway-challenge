# new class 'Order'
class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(food, quantity = 1)
    fail "Please enter a valid food selection!" unless @menu.menu_items.include?(food)
    fail "Please enter a valid number of items!" unless quantity >= 1
    quantity.times{ @basket << food }
  end
end
