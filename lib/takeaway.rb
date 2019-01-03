require_relative 'menu'
require_relative 'user_input'
require_relative 'order'
require_relative 'message'

class Takeaway

  attr_reader :menu, :order, :user_input, :message

  def initialize(menu = Menu.new, user_input = UserInput.new,
    order = Order.new, message = Message.new)
    @menu = menu
    @user_input = user_input
    @order = order
    @message = message
  end

  def display_menu
    menu.display
  end

  def order_from_menu
    display_menu.each do |item, price|
      if user_input.ask(item)
        quantity = user_input.quantity
      end
      order.add(item, quantity, price) if quantity != nil
    end
    order
  end

  def confirmation
    "The total to pay is #{order.total_to_pay}. Confirmation sms arriving soon" if message.send
  end

end
