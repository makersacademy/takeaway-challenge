require 'menu'

class Order

  def initialize
    @new_order = Menu.new
    @ordered = {}
  end

  def select_item(item, qty)
    @ordered
  end

  def total_cost
    @ordered
  end

  def list
    @new_order.display_menu
  end

end
