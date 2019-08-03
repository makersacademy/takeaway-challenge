class Order

  attr_reader :items

  def initialize(restaurant)
    @restaurant = restaurant
    @items = Hash.new
    @locked = false
  end

  def add(item, n)
    add_checks(item, n)
    push_item(item, n)
  end

  def close
    @locked = true
  end

  def closed?
    @locked
  end

  private
  
  def push_item(item, n)
    item = item.name
    !items[item] ? @items[item] = n : items[item] += n
  end

  def add_checks(item, n)
    raise "This dish is not available" unless @restaurant.menu.dishes_list.include?(item)
    raise "This order is closed" if closed?
  end

end