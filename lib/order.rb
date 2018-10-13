require_relative 'customer'
require_relative 'dish'

class Order

  attr_accessor :order, :list, :con

  def initialize
    @order = []
    @list  = []
    @con_list = []
  end

  def print_list
    @order.each do |dish|
      @list << dish if @list.include?(dish) == false
      dish.up_quantity if @list.include?(dish) && dish.is_a?(Dish)
    end
    @list.each do |dish|
      @con_list << "#{dish.name} x#{dish.quantity} $#{dish.quantity * dish.price}" if dish.is_a?(Dish)
    end
    @con_list
  end

  def added?
    @order.empty? ? false : true
  end

end
