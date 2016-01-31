require_relative 'menu.rb'
require_relative 'order.rb'
require_relative 'message.rb'

class Takeaway

attr_accessor :final_order

  def initialize(menu=Menu.new)
    @menu = menu
    @order = Order.new
    @message = Message.new
  end

  def show_menu
    @menu.menu_list
  end

  def order(dish, number=1)
    fail "Item not on the menu: please choose again" unless @menu.menu_list.include? dish
    @order.take_order(dish, number, @menu)
  end

  def basket
    @order.basket
  end

  def complete_order(price)
    fail 'Incorrect amount' if payment_correct?(price) != true
    send_text("Your order totalling $#{@order.total} has been registered and will be delivered before 18:52")
    @order.current_order.clear
  end

  private

  def send_text(message)
    @message.send_message(message)
  end

  def payment_correct?(price)
    price == @order.total
  end
end