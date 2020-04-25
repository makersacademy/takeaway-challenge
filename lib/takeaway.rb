require_relative 'menu'

class TakeAway
  attr_reader :menu, :order_total

  def initialize
    @menu = Menu.new
    @order_total = []
  end

  def menu_list 
    @menu.print
  end

  def order(order)
    @order_total << order if in_menu?(order)
    order
  end

  private

  def in_menu?(order)
    @menu.menu.key? order
  end

end