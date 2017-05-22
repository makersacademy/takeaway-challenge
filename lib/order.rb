require_relative 'menu'

class Order
  attr_reader :cart

  def initialize(menu)
    @menu = menu
    @cart = {}
  end

  def add_product(dish, amount)
    raise "#{dish} is not on the menu" unless menu.contain_dish?(dish)
    add_to_cart(menu.select_dish(dish), amount)
  end

  def total
    cart.map do |dish, amount|
      menu.select_dish(dish).price * amount
    end.sum
  end

  private

  attr_reader :menu

  def add_to_cart(dish, amount)
    cart[dish.name] = amount
    "#{amount} x #{dish.name} added to your cart"
  end
end
