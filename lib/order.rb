
class Order

  attr_accessor :order, :list

  def initialize
    @order = []
    @list  = []
    @con_list = []
    @total = 0
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

  def total
    @order.each do |dish|
      @total += dish.price
    end
    @total
  end

  def added?
    @order.empty? ? false : true
  end

end
