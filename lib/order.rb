class Order

  attr_reader :total

  ORDER_TIME = 30

  def initialize
    @order = []
    @total = 0
  end

  def add(item)
    @order.push(item)
    @total += item.price
  end

  def show
    @order.dup
  end

  def check_total
    total = 0
    @order.each { |dish| total += dish.price }
    @total == total
  end

end
