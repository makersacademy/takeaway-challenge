class Order
  attr_reader :order, :menu

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add_dish(dish)
    @order << { dish => @menu.dish_list[dish] }
  end
end
