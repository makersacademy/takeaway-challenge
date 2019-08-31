class Takeaway

  def initialize
    @menu = Menu.new
  end

  def place_order(order)
    order.valid(@menu.list_menu)
  end

end
  