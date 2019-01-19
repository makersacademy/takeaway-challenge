class Order

attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(item)
    @order << item
    return_order
  end

private

  def return_order
    @order
  end

end
