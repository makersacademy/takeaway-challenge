# require_relative 'basket'

class Takeaway
  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def show_menu
    menu.show
  end

  def order(dish, amount = 1)
    raise 'That dish is not on the menu' unless menu.includes_dish?(dish)
    basket.add(dish, amount)
    "Added #{amount} x #{dish} to your order"
  end
  #
  # def show_basket
  # end
  #
  # def add_to_basket(dish, amount)
  #   @basket << [dish, amount]
  # end
  private
  attr_reader :menu, :basket
end
