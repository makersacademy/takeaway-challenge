class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add_to_basket(dish, qty)
    @basket[dish] += qty
  end
end
