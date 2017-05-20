require_relative 'menu'

class Takeaway
  def initialize(menu)
    @menu = menu
    @cart = []
  end

  def read_menu
    @menu.show_menu
  end

  def order(dish, amount)
    product = @menu.select_dish(dish)
    add_to_cart(product, amount)
  end

  private

  def add_to_cart(product, amount)
    amount.times { @cart << product }
    "#{amount} x #{product[:name]} added to your cart"
  end

end
