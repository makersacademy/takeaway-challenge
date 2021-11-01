require 'order'
require 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu, order = nil)
    @menu = menu
    @order = order
  end

  def list_menu
    menu.list_menu
  end

  def order(dishes)
    dishes.each { |item, amount| order.add(item, amount) }
  end
end
