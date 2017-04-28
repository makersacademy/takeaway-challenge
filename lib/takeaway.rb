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
    raise offer_bargain(item) unless menu.include?(item.capitalize)
    order.add_to_basket(item.capitalize, quantity)
    "Added #{quantity} x #{item.capitalize} to your basket. #{quip}!"
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
    order_success
  end

  private

  attr_reader :order
  attr_accessor :text

  def order_success
    empty_basket
    text.send_message
    'Order placed successfully!'
  end

  def offer_bargain(item)
    "#{item.capitalize} is not on the menu. How about a tasty Cleanout curry?"
  end

  def quip
    ['Delicious', 'Infectious', 'Adventurous',
     'Enjoy', 'Tasty', 'Interesting choice', 'Great price'].sample
  end
end
