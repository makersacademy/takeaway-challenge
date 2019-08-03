class Order

  attr_reader :items

  def initialize(restaurant)
    @restaurant = restaurant
    @items = Hash.new
    @locked = false
  end

  def add(item, n)
    raise "This dish is not available" unless @restaurant.menu.dishes_list.include?(item)
    raise "This order is closed" if closed?
    item = item.name
    if !@items[item]
      items[item] = n
    else
      items[item] += n
    end
  end

  def close
    @locked = true
  end

  def closed?
    @locked
  end

end