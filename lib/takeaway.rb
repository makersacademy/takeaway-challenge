require_relative 'menu'
require_relative 'basket'
class Takeaway

  def initialize(menu)
    @menu = menu
    @basket = Basket.new
  end

  def show_menu
    menu.display
  end

  def order(dish, quantity = 1)
    menu_checker(dish)
    @basket.add_dish(dish, quantity)
    dish_confirmation(dish, quantity)
  end

  def check_basket
    @basket.contents
  end

  private #-------------------------------
  attr_reader :menu, :basket

  def dish_confirmation(dish, quantity = 1)
    puts "#{quantity}x #{dish}(s) added to basket"
  end

  def menu_checker(dish)
    raise "This item is not available on the menu" unless menu.dishes.has_key?(dish.to_sym)
  end
end
