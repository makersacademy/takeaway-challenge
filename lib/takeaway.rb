class Takeaway

  attr_reader :dish_selection, :quantity

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def menu
    @menu.see
  end

  def select_order(dish_selection, quantity)
    @dish_selection = dish_selection
    @quantity = quantity
    @order.place(dish_selection, quantity)
  end

  def check_bill?
    !!@order.total
  end

  def place
    if check_bill?
      @order.list
      @order.total
    else
      raise "Error"
    end
  end

end
