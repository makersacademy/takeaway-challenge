class Order
  attr_reader :dishes
  attr_reader :menu

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    raise "Apologies, #{dish} is not available" unless @menu.dish_available?(dish)
  
    @dishes[dish] = quantity
  end

  def bill
    @dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

  def total
    bill.sum
  end
end
