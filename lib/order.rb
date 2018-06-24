require_relative './dishes_list.rb'
require_relative './dish.rb'
require_relative './calculate_order.rb'

class Order

  attr_reader :dishes_list, :calc, :takeaway_order, :balance, :order_complete

  def initialize
    @dishes_list = DishesList.new
    @calc = CalculateOrder.new
    @takeaway_order = []
    @balance = 0
    @order_complete = false
  end

  def view_list
    dishes_list.view_list
  end

  def add_order(dish)
    @takeaway_order << dish
    @balance += dish[:price]
    @order_complete = false
     "Your order total: #{balance}"
  end

  def complete_order
    # add functionality to prevent user complete order
    # if takeaway_order is empty
    calculate_balance
    check_balance
    fail "balance does not match: check order" unless balance_match?
    @order_complete = true
    # include method here to receive a text
  end

  def check_balance
    balance_match?
  end

  private

#  this method checks the order balance match the sum of the order
  def calculate_balance
    @calc.calculate(@takeaway_order)
  end

  def balance_match?
    @calc.check_bal(@balance)
  end

end
