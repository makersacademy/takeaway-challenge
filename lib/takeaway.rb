require './lib/menu.rb'
require './lib/order.rb'
require './lib/text.rb'

class Takeaway

  attr_reader :menu, :text

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
  end

  def show_menu
    @menu.show
  end

  def add(dish, quantity = 1)
    @order.add_dish(dish, quantity)
  end

  def check_total
    @order.total
  end

  def confirm_order
    @text.send_text
    reset_order
  end

  private

  def reset_order
    @order = Order.new
  end
end
