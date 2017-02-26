class Order
  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = Hash.new(0)
    @menu = menu
  end

  def place_order(dish, quantity)
    fail "the requested item is not on the menu" unless menu.dish_available?(dish)
    @dishes[dish] += quantity
  end



end # => class Order
