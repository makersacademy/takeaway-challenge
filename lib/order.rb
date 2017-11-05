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
    update_items(item, quantity)
    update_total(quantity)
  end

  private

  def get_item(item)
    @restaurant.menu.select { |dish| dish.name == item }[0]
  end

  def update_items(item, quantity)
    quantity.times { @items.push(get_item(item)) }
  end

  def update_total(quantity)
    @items.last(quantity).each { |dish| @total += dish.price }
  end

end
