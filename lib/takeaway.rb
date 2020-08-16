class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  attr_reader :menu, :order

  def view_menu
    @menu.view
  end

end
