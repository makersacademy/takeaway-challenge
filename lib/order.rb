require_relative 'customer'
require_relative 'dish'

class Order

  attr_reader :order

  def initialize
    @order = []
    @list  = []
    @print_list = []
  end

  def print_list
    @order.each do |dish|
      @list << dish if @list.include?(dish) == false
      dish.up_quantity if @list.include?(dish)
    end
    @list.each do |dish|
      @print_list << "#{dish.name} x#{dish.quantity} $#{dish.quantity * dish.price}"
    end
    @print_list
  end

  def added?
    @order.empty? ? false : true
  end
end
