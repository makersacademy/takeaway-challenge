require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'
class Takeaway 
  attr_reader :menu, :order_total
  def initialize(menu = Menu.new, order = Order.new, send_sms = SendSms.new)
    @menu = menu
    @order = order
    @send_sms = send_sms
  end

  def view_menu
    @menu.view_dishes
  end

  def add_to_order(dish, price, quantity)
    raise "Dish unavailable" if @menu.available?(dish) == false

    @order.add(dish, price, quantity)
  end

  def view_order
    @order.view
  end

  def order_total
    puts "You have selected #{@order.dish_count} dishes at a total cost of £#{@order.total_cost}."
  end

  def confirm_order(payment)
    raise "Incorrect payment" if @order.total_cost != payment 

    @send_sms.send_message
  end
end
