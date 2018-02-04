require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu: Menu.new, order: Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.print_centered
  end

  def take_order
    @order.note_down(@menu.options)
  end

  def verify_current_order
    @order.print_verification(@menu.options)
  end

end
