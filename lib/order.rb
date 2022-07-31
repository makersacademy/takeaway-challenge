class Order

  attr_reader :quantity, :dish, :current_order, :menu, :cost_calculator

  def initialize(menu, cost_calculator = CostCalculator.new)
    @menu = menu
    @cost_calculator = cost_calculator
    @current_order = []
  end

  def view_menu
    @menu.view
  end

  def place_order(dish, quantity)
    raise "Item is not on the menu" unless @menu.menu_contents.include?(dish)
    @quantity = quantity
    @dish = dish
    puts add_order_to_current_order
  end

  def add_order_to_current_order
    @current_order << { "dish" => @dish, "quantity" => @quantity }
    "#{quantity} x #{dish} have been added to your order. #{return_total}"
  end

  def total
    @cost_calculator.calculate(@current_order, @menu.menu_contents)
  end

  def return_total
    "Total: £#{total}"
  end

  def checkout(payment)
    raise "Payment incorrect" if payment != total
    "Order confirmed"
  end

end
