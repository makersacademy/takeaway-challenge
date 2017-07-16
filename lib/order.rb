require 'dish_list'

class Order

  def initialize (list = DishList.new)
    @list   = list
    @order  = Hash.new
    @total  = 0
  end

  def make(order)
    update_order(order)
    update_total
  end

  def total
  end

  private

  attr_accessor 'order'

  def list
    @list.dup
  end

  def update_order(order_data)
    @order = order_data
  end

  def update_total
    @order.each do |id, amount|
      dish = dish_with_id(id)
      @total += dish.price * amount
    end
  end

  def dish_with_id(id)
    list.data.select { |n| n.id == id }.last
  end
end
