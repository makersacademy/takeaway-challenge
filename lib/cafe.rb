require_relative 'menu'
require_relative 'order'

class Cafe
  attr_reader :menu, :order, :juice, :expected_total

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @juice = juice
    @expected_total = expected_total
  end

  def display
    menu.show_menu
  end

  def select_juices(juice)
    menu.on_menu?(juice)
    order.add_to_basket(juice)
  end

  def show_basket
    order.basket
  end

  def check_total(expected_total)
    order.total(expected_total)
  end
end
