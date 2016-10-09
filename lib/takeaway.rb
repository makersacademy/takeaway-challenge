require_relative "menu"
require_relative "order"

class Takeaway
  attr_reader :menu, :order_list

  def initialize
    @menu = Menu.new
    @order_list = {}
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quantity)
    @order_list[item.to_sym] = total_price(item, quantity)
  end

  private

  def total_price(item, quantity)
    quantity * menu.list[item.to_sym]
  end

end
