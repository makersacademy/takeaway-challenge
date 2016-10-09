require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :see_menu, :order

  def initialize
    @menu =  Menu.new
    @order = Order.new
    @sms = Sms.new
  end

  def see_menu
    @menu.menu_list
  end

  def make_an_order(item)
    @order.select_dish(item)
    puts "You have selected #{@menu.menu_list[item - 1]}"
    @order.current_order
  end

  def checkout_price
    @order.total_price
  end

  def confirm_order
    raise "Your checkout basket is empty" if @order.current_order.empty?
    @sms.send
  end

end
