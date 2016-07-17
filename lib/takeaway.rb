require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def read_menu
    @menu.print_menu
  end

  def order(dish, quantity)
    fail "Sorry, this is not on the menu" unless on_menu?(dish)
    @basket.add(dish, quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def basket
    @basket.basket_summary
  end

  def total
    @basket.total
  end

  private

  attr_reader :menu

    def on_menu?(dish)
      !@menu.dishes[dish].nil?
    end

end
