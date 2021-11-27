require_relative './menu'

class TakeAway
  def initialize(menu: Menu.new)
    @menu = menu
    @cart = []
  end

  def menu
    @menu.list_dishes
  end

  def add_to_cart(name, number)
    @cart << @menu.select_dish(name, number)
  end

  def cart
    @cart
  end

end
