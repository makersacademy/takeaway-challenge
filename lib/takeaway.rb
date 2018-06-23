require_relative 'basket'
require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def show_menu
    menu.show
  end

  def order(dish, amount = 1)
    raise 'That dish is not on the menu' if not_on_menu?(dish)
    price = menu.price(dish)
    basket.add(dish, amount, price)
    order_confirmation(dish, amount)
  end

  def show_basket
    basket.show
  end

  private

  attr_reader :menu, :basket

  def not_on_menu?(dish)
    !menu.includes_dish?(dish)
  end

  def order_confirmation(dish, amount)
    "Added #{amount} x #{dish} to your order"
  end
end
