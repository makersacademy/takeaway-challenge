class Order

  def initialize
    @new_order = Menu.new
    @ordered = []
  end

  def selection(item, qty)
    @ordered << { item => qty }
  end

  def total_cost
    @ordered
  end

  def list
    @new_order.display_menu
  end

end
