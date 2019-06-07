class Order

  attr_reader :quantity, :dish, :current_order, :menu, :cost_calculator

  def initialize(menu=Menu.new, cost_calculator=Cost_calculator.new)
    @menu = menu
    @cost_calculator = cost_calculator
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
