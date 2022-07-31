require_relative './menu'

class Takeaway
  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.view
  end

  def select(*dishes)
    @order = @menu.select(dishes)
  end

  def view_order
    @order.summary
  end
end
