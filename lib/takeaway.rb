require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway

  include Message

  attr_reader :menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    menu.print_menu
  end

  def add_to_order(item)
    new_order if @current_order.nil?
    @current_order.add_item(item)
  end

  def check_order
    fail 'Your order is empty' unless @current_order
    @current_order.calculate_total
  end

  def place_order
    fail 'Your order is empty' unless @current_order
    send_message
    end_order
  end

  private

  def new_order
    @current_order = Order.new(@menu)
  end

  def end_order
    @current_order = nil
  end

end
