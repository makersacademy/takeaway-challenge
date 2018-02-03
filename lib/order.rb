class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
  end

  def add(dish, quantity)
    @menu = Menu.new
    fail "This dish is not on the menu" unless @menu.dishes.has_key?(dish)
    @basket[dish] = quantity
    "#{dish} x#{quantity}"
  end

end
