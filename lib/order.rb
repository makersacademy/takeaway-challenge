class Order

  def initialize
    @order = []
  end

  def add_to_order(item)
    @order << item
  end

  def return_order
    @order
  end

end
