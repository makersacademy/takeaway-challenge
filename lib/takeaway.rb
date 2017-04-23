require_relative 'menu'
require_relative 'order'
require_relative 'sms'

# Understands managing orders
class Takeaway
  attr_reader :menu

  def initialize(order_class = Order, menu = Menu, text = Sms)
    @order_class = order_class
    @menu = menu.new
    @text = text.new
    empty_basket
  end

  def view_menu
    menu.dishes
  end

  def empty_basket
    @order = @order_class.new
  end

  def add(item, quantity = 1)
    item = item.capitalize
    raise offer_old_stock(item) unless on_menu?(item)
    order.add_to_basket(item, quantity)
    "Added #{quantity} x #{item} to your basket. #{quip}!"
  end

  def check_basket
    order.basket
  end

  def check_total
    order.calculate_total
  end

  def basket_summary
    order.basket_summary
  end

  def checkout(total)
    check_total
    raise 'Incorrect total' unless total == order.total
    empty_basket
    text.send_message
  end

  private

  attr_reader :order
  attr_accessor :text

  def on_menu?(item)
    view_menu.include?(item)
  end

  def offer_old_stock(item)
    "#{item} is not on the menu. Why not try our delicious Cleanout curry?"
  end

  def quip
    ['Delicious', 'Infectious', 'Adventurous',
     'Enjoy', 'Tasty', 'Interesting choice', 'Great price'].sample
  end
end
