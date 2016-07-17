require_relative 'menu'
require_relative 'basket'
require_relative 'sms'

class Takeaway

  def initialize(menu = Menu.new, basket = Basket.new, sms = Sms.new)
    @menu = menu
    @basket = basket
    @sms = sms
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

  def confirm_order
    @sms.deliver
  end

  private

  attr_reader :menu

    def on_menu?(dish)
      !@menu.dishes[dish].nil?
    end

end
