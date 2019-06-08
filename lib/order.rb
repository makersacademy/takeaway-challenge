class Order

  attr_reader :quantity, :dish, :current_order, :menu, :cost_calculator

  def initialize(menu, cost_calculator=Cost_calculator.new)
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
    add_order_to_current_order
  end

  def add_order_to_current_order
    @current_order << { "dish" => @dish, "quantity" => @quantity }
    "#{quantity} x #{dish} have been added to your order"
  end

  def running_total
    "Your total so far: #{@cost_calculator.total_price}"
  end

end
