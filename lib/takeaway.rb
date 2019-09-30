class Takeaway

  attr_reader :dish_selection, :quantity

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
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
    @text.message
  end
  
  # def place
  #   if check_bill?
  #     @order.list
  #     @order.total
  #   else
  #     raise "Error"
  #   end
  # end

end
