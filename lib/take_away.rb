require 'twilio-ruby'
require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

#Knows about the menu and gets orders

class TakeAway

  def initialize(menu = Menu.build_default_menu, order_class = Order, messenger_class = Messenger)
    @menu = menu
    @order = nil
    @order_class = order_class
    @messenger_class = messenger_class
  end

  def show_menu
    @menu.print_menu
  end

  def take_order
    order_class.input_instructions
    order_string = gets
    @order = order_class.new(order_string, @menu)
    "Total Price: #{@order.price_total}"
  end

  def price
    @order.price_total
  end





private

  attr_reader :order_class

  def send_message
    messenger = @messenger_class.new
    time = Time.now + 3600
    body = "Thank you! The total amout due for your order is #{order_price} and it will be delivered before #{time.hour}:#{time.min} "
    messenger.set_message("Restaurant", "+447756242388", body)
    messenger.send_message
 end



end
