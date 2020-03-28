class Order

  def initialize 
    @order = []
  end

  def show_order 
    @order
  end

  def add_item(item, quantity = 1)
    @order << [item, quantity]
  end

end
