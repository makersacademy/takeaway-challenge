require_relative 'menu'
require_relative 'bill_calculator'
require_relative 'text'
class Takeaway

  attr_reader :order, :cost, :get_bill

  def initialize
    @menu = Menu.new
    @order = []
    @get_bill = BillCalculator.new
  end

  def display_menu
    @menu.show_menu
  end

  def select_dish(dish)
    fail "Selection unavailable" if @menu.on_menu?(dish) == false

    @order.push(dish)
  end

  def place_order(number)
    @get_bill.bill(@order)
    text(number)
    @order = []
  end

  def text(number)
    Text.new.send(number)
  end

end
