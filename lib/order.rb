require_relative './dishes_list.rb'
require_relative './calculate_order.rb'

class Order

  attr_reader :dishes_list, :takeaway_order, :calculate_order

  def initialize
    @dishes_list = DishesList.new
    @takeaway_order = []
    @calculate_order = CalculateOrder.new
  end

  def view_list
    dishes_list.view_list
  end

  def add_order(food)
    @takeaway_order << food
  end

  def complete_order
    # add functionality to prevent user complete order
    # if takeaway_order is empty
    @calculate_order.calculate(@takeaway_order)
    puts "Your order total: #{calculate_order}"
  end

end
