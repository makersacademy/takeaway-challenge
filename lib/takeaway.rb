require_relative 'menu'
require_relative 'order'
require_relative 'dish'
require 'twilio-ruby'

class Takeaway
  attr_reader :menu, :order, :total_orders

  def initialize(menu_class: Menu, order_class: Order)
    @menu = menu_class.new
    @order = order_class.new
    @total_orders = []
  end

  def read_menu
    @menu.read_menu
  end

  def add_to_order(name, quantity = 1)
    @menu.dish_list.each do |dish|
      @order.add_to_basket(dish, quantity) if dish.name == name
    end
  end

  def checkout
    @order.basket_summary
    puts ""
    puts "Total amount to pay #{@order.total}"
  end

  def complete(amount)
    raise RuntimeError, 'Amount to pay does not match total' unless amount == @order.total
    @order.complete_order
    @total_orders << @order
    send_message
  end

  private
  def send_message
    account_sid = "AC5753bf622b1a4f4f5342d06ed8efcf99"
    auth_token = "ba8cc4a30318eae2b599331c3435d1ae"
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Your order is confirmed",
    to: "+447925276696",
    from: "+447925276696")
    puts message.sid
  end

end
