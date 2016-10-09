require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @cart = Hash.new(0)
    @menu = menu
    @total = 0
  end

  def add_to_order(item, quantity = 1)
    @total += @menu.check_price(item) * quantity
    @cart[item.capitalize] += quantity
  end
end
