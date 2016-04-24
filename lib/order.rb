class Order

  def initialize
    @order = {}
    @total = []
  end

  def add_to_order(quantity,item)
    @order[quantity] = item
    @total << item.values.map{|i|i*quantity}
  end

  def show_order
    @order.dup
  end

  def check_total
    @total.flatten.reduce(:+)
  end
end
