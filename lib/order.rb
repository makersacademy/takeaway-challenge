require_relative "takeaway"

class Order
  attr_reader :id, :restaurant, :total, :items

  @@orders = []

  def initialize(restaurant)
    @id = 1 + @@orders.count
    @@orders.push(self)
    @restaurant = restaurant
    @total = 0
    @items = []
  end

  def add_item(item, quantity)
    raise "This item doesn't exist at this restaurant." if get_item(item).nil?
    increase_total(quantity)
    increase_items(item, quantity)
  end

  def remove_item(item)
    raise "This item is not in this order." if check_order(item).nil?
    decrease_total(item)
    decrease_items(item)
  end

  private

  def get_item(item)
    @restaurant.menu.select { |dish| dish.name == item }[0]
  end

  def increase_items(item, quantity)
    quantity.times { @items.push(get_item(item)) }
  end

  def increase_total(quantity)
    @items.last(quantity).each { |dish| @total += dish.price }
  end

  def decrease_items(item)
    item_to_delete = @items.select { |dish| dish.name == item }[0]
    @items.delete_at(@items.find_index(item_to_delete))
  end

  def decrease_total(item)
    item_to_delete = @items.select { |dish| dish.name == item }[0]
    @total -= item_to_delete.price
  end

  def check_order(item)
    @items.select { |dish| dish.name == item }[0]
  end

end
