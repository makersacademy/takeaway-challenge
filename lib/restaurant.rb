require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Restaurant
  attr_reader :menu, :order, :message

  def initialize(menu = Menu.new, order = Order.new, message = Message.new)
    @menu = menu
    @order = order
    @message = message
  end

  def show_menu
    @menu.show
  end





end
