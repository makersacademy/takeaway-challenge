class App
  attr_reader :list, :order_class
  def initialize(list_class = DishList, order_class = Order)
    @list = list_class.new
    @order_class = order_class
  end 

  def display_menu
    list.display
  end
  
  def new_order
    order_class.new
  end 
  def select_dish(item, quantity)
    list.select(item, quantity)
  end 
end