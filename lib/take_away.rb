require 'twilio-ruby'
require_relative 'menu'
require_relative 'order_parser'
require_relative 'messenger'

#Knows about the menu and gets orders

class TakeAway

  def initialize(menu = Menu.build_default_menu, parser_class = OrderParser, messenger_class = Messenger)
    @menu = menu
    @order = nil
    @parser_class = parser_class
    @messenger_class = messenger_class
  end

  def show_menu
    @menu.print_menu
  end

  def take_order
    @parser_class.input_instructions
    @order = @parser_class.parse(gets)
    send_message
  end

  def order_price
    @menu.price_total(@order)
  end




private

  def send_message
    messenger = @messenger_class.new
    time = Time.now + 3600
    body = "Thank you! The total amout due for your order is #{order_price} and it will be delivered before #{time.hour}:#{time.min} "
    messenger.set_message("Restaurant", "+447756242388", body)
    messenger.send_message
 end



end
