class Order

  def initialize
    @order = []
  end

  def add(item)
    @order.push(item)
  end

  def show
    @order.dup
  end

end
