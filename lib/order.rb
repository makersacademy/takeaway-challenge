class Order
  attr_reader :order, :menu

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add_dish(dish)
    @order << { dish => @menu.dish_list[dish] }
  end

  def total_price
    @order.map { |hash| hash.values }.flatten.sum
  end

  def check_price(price)
    price == total_price
  end
end
