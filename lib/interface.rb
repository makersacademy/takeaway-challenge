class Interface
  attr_reader :greeting, :order

  def initialize
    @menu = Menu.new
    @order = {}
  end

  def show_menu
    @menu.menu_list
  end

  def show_order
    @order
  end

  def add_to_order(food)
    @order[food] = @menu.menu_list[food]
  end

end
