require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :order, :menu, :order_history

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
    @order_history = []
  end

  def show_menu
    @menu.show
  end

  def add_dish(number)
    @order.add_dish(number)
  end

  def remove_dish(number)
    @order.remove_dish(number)
  end

  def show_order
    @order.show
  end

  def reset_order
    @order = Order.new
  end

  def confirm_order
    send_text
    finish_order
  end

private

  def finish_order
    @order_history << @order
    reset_order
  end

  def send_text
  end

end
