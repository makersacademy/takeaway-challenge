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

  def total
    total_items = 0
    @order.each { |item| total_items += item[1] }
    "Total items: #{total_items}"
  end

end
