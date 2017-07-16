require 'dish_list'

class Order
  def initialize(list = DishList.new)
    @list_data = list.data
    @total = 0
    @order_data = Hash.new
  end

  def make(order)
    @order_data = order
  end

  def total
    @order_data.each do |k,v|
      @total += @list_data[k] * v
    end
    @total
  end
end
