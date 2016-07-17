
class Restaurant

  attr_reader :menu, :order, :basket, :subtotals

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @subtotals = []
    @basket = []
    end

  def show_menu
    menu.print_menu
  end

  def order_dish(dish:, quantity:)
    order.store(dish,quantity)
  end

  def view_basket
    calculate_basket
    @basket_details
  end

  def total
    calculate_total
    "Total: £#{@total}"
  end

private

  def subtotal(dish,quantity)
    menu.find_cost(dish) * quantity
  end

  def calculate_total
    order.each do |dish,quantity|
      subtotals << (subtotal(dish,quantity))
      @total = sum_and_round(subtotals)
    end
  end

  def calculate_basket
    order.each do |dish,quantity|
      basket << "#{dish} x #{quantity} = £#{"%.2f" % (subtotal(dish,quantity))}"
    @basket_details = basket.join(" ")
    end
  end

  def sum_and_round(subtotal)
    "%.2f" % (subtotal.reduce(:+))
  end

end
