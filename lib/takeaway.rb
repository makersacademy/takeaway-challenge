require './lib/menu.rb'
require './lib/order.rb'
# require './send_sms.rb'
class Takeaway 
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    @menu.display
  end

  def display_order
    @order.display
  end

  def add(name, quantity)
    selected_item = @menu.find_item(name)
    @order.add(selected_item, quantity)
    @menu.update(name, quantity)
    "#{quantity} x #{name} added"
  end

  def total
    @order.total
  end

  def complete
    @order.complete
    # send_text(delivery_time)
  end

  # def send_text(delivery_time)
  #   send_sms(@orders.delivery_time)
  # end
end
