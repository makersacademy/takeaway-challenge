require_relative 'menu'

class Order

  attr_reader :menu, :order_items

  def initialize(menu_session)
    @menu = menu_session.new
    @order_items = []
  end

  def read_menu
    self.menu.view
    puts ""
    puts "*When ordering, please provide the name and amount of the dish being ordered"
  end
end
