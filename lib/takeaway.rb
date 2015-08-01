class TakeAway


  attr_reader :menu
  attr_accessor :order

  def initialize
    @order = {}
  end

  def add_menu(menu)
    @menu = menu.dishes
  end

  def show_menu
    menu
  end

  def place_order(dish, quantity)
    order["#{dish} x #{quantity}"] = total_cost_per_item(menu[dish], quantity)
  end

  def total_cost_per_item(price, quantity)
    price * quantity
  end

end

