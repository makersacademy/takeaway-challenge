class Interface

  attr_reader :order, :menu

  def initialize
    @menu = Menu.new
    @order = Order.new(@menu)
  end

  def view_menu
    menu.board
  end

  def ordering(dish_number)
    order.ordering(dish_number)
  end




end
