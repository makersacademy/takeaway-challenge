class Order
  attr_reader :new_order, :restaurant, :status

  def initialize restaurant
    @new_order = {}
    @restaurant = restaurant
    @status = 'open'
  end

  def add_item name, number = 1
    fail 'Order is closed' if status == 'closed'
    fail 'Dish not in the menu' unless check_dish name
    @new_order[name] = [number, (@restaurant.menu.list[name] * number).round(2)]
  end

  def remove_item name, number = 1
    check_remove name
    @new_order[name][0] -= number
    @new_order[name][1] -= (@restaurant.menu.list[name] * number).round(2)
    @new_order.delete(name) if @new_order[name][0] <= 0
  end

  def total
    total = 0
    @new_order.each_value { |value| total += value[1] }
    total.round(2)
  end

  def close expected_total
    fail 'The total is not the expected one' if expected_total != total
    fail 'Order is already closed' if @status == 'closed'
    @status = 'closed'
  end

  def send_order telephone
    fail 'Order is empty' if @new_order.empty?
    fail 'Order is not closed yet' if @status == 'open'
    @restaurant.get self, total, telephone
  end

  private

  def check_dish name
    @restaurant.menu.list.keys.include?(name)
  end

  def check_remove name
    fail 'Item is not in the order' unless new_order[name]
  end
end
