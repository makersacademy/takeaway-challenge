require_relative 'menu'
require_relative 'order'
require_relative 'sms'

# Understands managing orders
class Takeaway
  attr_reader :menu

  def initialize(order_class = Order)
    @order_class = order_class
    @menu = Menu.new
    @text = Sms.new
    empty_basket
  end

  def view_menu
    @menu.dishes
  end

  def empty_basket
    @order = @order_class.new
  end

  def add(item, quantity = 1)
    item = item.downcase.capitalize
    raise offer_old_stock(item) unless on_menu?(item)
    @order.add_to_basket(item, quantity)
    "Added #{quantity} x #{item} to your basket. #{quip}!"
  end

  def check_basket
    @order.basket
  end

  def check_total
    @total = 0
    check_basket.each { |x| @total += x[:price] }
    "Basket total: £#{format('%.2f', @total)}"
  end

  def basket_summary
    return 'Basket is empty' if check_basket.empty?
    [@order.basket, check_total]
  end

  def checkout(total)
    check_total
    raise 'Incorrect total' unless total == @total.round(2)
    @text.send_message
  end

  private

  attr_writer :text

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
