class OrderList
  attr_reader :orders
  def initialize
    @total = 0
    @orders =  []
  end

  def show_orders
    orders
  end

  def store_order(order)
    @orders << order
  end

  def stringify_cost
    reset_total
    get_cost
    "£%.2f" % total
  end

  private
  attr_reader :total

  def reset_total
    @total = 0
  end

  def get_cost
    newarr = []
    sum = 0
    orders.each do |dish|
      dish.each { |k,v| newarr << v if k == :price}
    end
    @total = newarr.reduce(:+)
  end
end

#
# this.store_order({ order_num: 2, name: "Cheese Toastie", price: 2.00 })
# class Any
#   attr_reader :orders, :total
#   def initialize
#     @total = 0
#     @orders =  orders = [{ order_num: 2, name: "Cheese Toastie", price: 2.00 },{ order_num: 2, name: "Cheese Toastie", price: 2.00 }]
#  end
#
#  def stringify_cost
#    cost = get_cost
#    "£%.2f" % cost
#  end
#
#  def get_cost
#    sum = 0
#    orders.each do |dish|
#      p dish[:price]
#      sum += dish[:price]
#    end
#    @total = sum
#  end
# end
