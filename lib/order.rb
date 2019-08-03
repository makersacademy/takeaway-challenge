class Order

  attr_reader :items

  def initialize(restaurant)
    @restaurant = restaurant
    @items = Hash.new
    @locked = false
  end

  def add(item, quantity)
    add_checks(item, quantity)
    push_item(item, quantity)
  end

  def remove(item, quantity)
    item = item.name
    raise "This order is closed" if closed?
    raise "No #{item} currently in order" if items[item].nil?
    items[item] -= quantity
    items.delete(item) if items[item] <= 0
  end

  def close
    @locked = true
  end

  def closed?
    @locked
  end

  private

  def push_item(item, quantity)
    item = item.name
    !items[item] ? @items[item] = quantity : items[item] += quantity
  end

  def add_checks(item, quantity)
    raise "This order is closed" if closed?
    raise "This dish is not available" unless item_on_menu?(item)
  end

  def item_on_menu?(item)
    @restaurant.menu.dishes_list.include?(item)
  end

end
