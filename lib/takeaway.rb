require_relative 'menu'
require_relative 'user_input'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :user_input

  def initialize(menu = Menu.new, user_input = UserInput.new, order = Order.new)
    @menu = menu
    @user_input = user_input
    @order = order
  end

  def display_menu
    menu.display
  end

  def order_from_menu
    display_menu.each do |item, _|
      if user_input.ask(item)
        quantity = user_input.quantity
      end
      order.add(item, quantity) if quantity != nil
    end
    order.total_to_pay
  end

end
