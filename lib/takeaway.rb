require_relative 'menu'
require_relative 'order'

# Understands managing orders
class Takeaway
  attr_reader :menu

  def initialize(order_class = Order)
    @order_class = order_class
    @menu = Menu.new
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
    raise suggest_spoiling_stock(item) unless on_menu?(item)
    @order.add_to_basket(item, quantity)
    "Added #{quantity} x #{item} to your basket. #{quip}!"
  end

  def check_basket
    @order.basket
  end

  def check_total
    total = 0
    check_basket.each { |x| total += x[:price] }
    "Basket total: £#{format('%.2f', total)}"
  end

  def basket_summary
    return 'Basket is empty' if check_basket.empty?
    [@order.basket, check_total]
  end

  private

  def on_menu?(item)
    view_menu.include?(item)
  end

  def suggest_spoiling_stock(item)
    "#{item} is not on the menu. Why not try our delicious Cleanout curry?"
  end

  def quip
    ['Delicious', 'Infectious', 'Adventurous',
     'Enjoy', 'Tasty', 'Really?', 'Great price'].sample
  end
end
