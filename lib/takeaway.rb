require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway

  attr_reader :menu, :order, :text

  def initialize(menu=Menu.new)
    @menu = menu
    @order = Order.new
    @text = Text.new
  end

  def show_menu
    menu.print_menu
  end

  def place_order(dish,quantity)
    order.add(dish,quantity)
  end

  def sub_total
    order.dish_price
  end

  def total_amount
    order.total
  end

  def complete_order(price)
    fail "Sorry, sum is not correct" unless correct_amount?(price)
    textsend_text
  end


private

  def correct_amount?(price)
    total_amount == price
  end
end
