require_relative 'menu'
require_relative 'order'
require_relative 'text'


class Takeaway

  attr_reader :menu, :order, :text

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @text = Text.new
  end

  def show_menu
    menu.display_dishes
  end

end
