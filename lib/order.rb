class Order

  attr_reader :orders, :count, :total

  def initialize
    @orders = {}
    @count = 0
    @total = 0
  end

  def add_dish(dish, quantity)
    @orders[dish] = quantity
  end

  def current_order
    @orders
  end

  def item_count
    orders.each { |dish, amount| @count += amount }
    @count
  end

  def order_total
    orders.each { |dish, amount| @total += (dish.price * amount) }
    @total
  end
end
