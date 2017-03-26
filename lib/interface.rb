require_relative 'twilio'

class Interface

  include TextMessage

  attr_reader :order, :menu

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
  end

  def view_menu
    menu.board
  end

  def ordering(dish_number)
    order.ordering(dish_number)
  end

  def place_order
    send_message
  end




end
