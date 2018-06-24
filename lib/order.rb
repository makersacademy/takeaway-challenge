require_relative './dishes_list.rb'
require_relative './dish.rb'
require_relative './calculate_order.rb'

class Order

  attr_reader :dishes_list, :takeaway_order, :calc, :balance

  def initialize
    @dishes_list = DishesList.new
    @takeaway_order = []
    @calc = CalculateOrder.new
    @balance = 0
  end

  def view_list
    dishes_list.view_list
  end

  def add_order(dish)
    @takeaway_order << dish
    @balance += dish[:price]
  end

  def complete_order
    # add functionality to prevent user complete order
    # if takeaway_order is empty
    calculate_order
    puts "Your order total: #{calculate_order}"
  end

  private

  attr_reader :calculate_order

  # this method checks the order balance
  def calculate_order
    @calc.calculate(@takeaway_order)
  end

end
