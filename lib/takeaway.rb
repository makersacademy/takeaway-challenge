require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway

  attr_reader :menu, :order, :text

  def initialize(menu = Menu, order = Order, text = Text)
    @menu = menu.new
    @order = order.new
    @text = text
  end

  def show_menu
    menu.display_dishes
  end

  def add(dish, quantity)
    fail 'That dish is not available' unless show_menu.include?(dish)
    order.select_dishes(dish, quantity)
  end

  def view_order
    view = order.selected_dishes
    "Your selected dishes are #{view}"
  end

  def order_price
    "Your total order price is £#{order.total_price}"
  end

  def amount?(price)
    price == order.total_price
  end

  def confirm_order
    order.total_price == order.total ? @text.new.send_text : order.total_price
    "Thank you, your delivery time will be sent by text shortly"
  end


end
