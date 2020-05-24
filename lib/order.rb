class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = []
  end

  def add(dish, quantity)
    raise "Apologies, #{dish} is not available" unless @menu.dish_available?(dish)

    quantity.times { @dishes.push(dish) }
  end
end
