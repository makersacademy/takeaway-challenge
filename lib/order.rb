class Order

  def initialize
    @order_items = []
  end

  def items
    @order_items.dup
  end

  def add_item(item, qty)
    order_item = select_order_item(item)
    if order_includes?(order_item)
      update_quantity(order_item, qty)
    else
      order_item = {item: item, quantity: qty}
      @order_items << order_item
    end
    order_item
  end

  def remove_item(item, qty)
    order_item = select_order_item(item)
    if order_includes?(order_item)
      if order_item[:quantity] == qty
        @order_items.delete(order_item)
      else
        update_quantity(order_item, -qty)
      end
    end
  end

  def total
    total = 0
    @order_items.each do |order_item|
      total += order_item[:item].price.to_f * order_item[:quantity]
    end
    total
  end

  private

  def select_order_item(item)
    @order_items.select{ |order_item| order_item[:item] == item }.first
  end

  def update_quantity(order_item, qty)
    order_item[:quantity] += qty
  end

  def order_includes?(order_item)
    @order_items.include?(order_item)
  end

end
