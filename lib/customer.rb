require './lib/menu'

class Customer
  def place_order(dish, quantity)
    menu.basket()
  end
end