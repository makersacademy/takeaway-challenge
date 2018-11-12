class Order

  attr_reader :order_time,
              :order_items,
              :delivery_time,
              :order_placed

  TIME_TO_DELIVER = 60 * 60

  def initialize
    @order_items = Array.new
  end

  def add_item(item)
    @order_items << item
  end

  def list_order
    @order_items.map { |item| [item.name, item.price] }
  end

  def give_total
    @order_items.inject(0) { |total, item| total + item.price }
  end

  def confirm_order
    @order_time = Time.now
    @delivery_time = @order_time + TIME_TO_DELIVER
    @order_placed = true
  end

end
