require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order 

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def view_menu
    @menu.print_menu
  end

  def add_item(item, quantity)
    @order << {item => quantity}
  end

end
