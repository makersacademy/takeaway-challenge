class Order

  attr_reader :quantity, :dish, :current_order

  def initialize(menu=Menu.new)
    @menu = menu
    @current_order = []
  end

  def view_menu
    @menu.view
  end

  def place_order(dish, quantity)
    raise "Item is not on the menu" if !@menu.menu_contents.include?(dish)
    @quantity = quantity
    @dish = dish
    @current_order << { "dish" => @dish, "quantity" => @quantity }
    "#{quantity} x #{dish} have been added to your order"
  end

end
