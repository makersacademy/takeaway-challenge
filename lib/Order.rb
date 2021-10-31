
class Order
  def menu
    @menu = Menu.new
  end

  def ordered_items
    menu.order
  end

  def order_total
    #  total = (menu.order[0][1]) + (menu.order[1][1])
  end
  
end