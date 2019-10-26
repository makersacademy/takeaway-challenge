require_relative 'menu'
require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu

  def initialize
  @menu = Menu.new
end

  def print_menu
    @menu.menu
    end

    def add_item(item, quantity)
    @order.add(item, quantity)
  end
end
