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

  # to be continued: implement a method that manages all the below?
  # def manage_order
  #   order_from_menu
  #   order.total_to_pay
  #   send_message
  # end

  def order_from_menu
    display_menu.each do |item, _|
      if user_input.ask(item)
        quantity = user_input.quantity
      end
      order.add(item, quantity) if quantity != nil
    end
    order
  end

  def total_to_pay
    order.total_to_pay
  end

  def send_message
    message.send
  end

end
