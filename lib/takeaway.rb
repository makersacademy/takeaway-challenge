require_relative 'menu'
require_relative 'order'
require_relative 'calculate'
require_relative 'text'

class Takeaway

  ERROR = "Please enter the exact sum"
  TIME = Time.new
  MESSAGE = "Success! Your order was placed and will be delivered before #{(TIME.hour + 1) < 10 ? "0" : ""}#{TIME.hour + 1}#{TIME.min < 10 ? "0" : ""}#{TIME.min}"
  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    @order.take(dish, quantity)
  end

  def basket_summary
    @order.display
  end

  def total
    Calculate.add(@order.basket_with_prices)
  end

  def checkout(sum)
    raise ERROR if sum != total 
    
    @text.send(MESSAGE)
  end
end
