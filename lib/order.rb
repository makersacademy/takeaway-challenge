require 'dish_list'

class Order

  def initialize (list = DishList.new)
    @list   = list
    @order  = Array.new
    @total  = 0
  end

  def make(order_data)
    
  end

  private

  attr_accessor 'order'

  def list
    @list.dup
  end
end
