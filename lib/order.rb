class Order

  attr_reader :items

  def initialize(restaurant)
    @restaurant = restaurant
    @items = Hash.new
  end

  def add(item, n)
    raise "This dish is not available" unless @restaurant.menu.dishes_list.include?(item)
    item = item.name
    if !@items[item]
      items[item] = n
    else
      items[item] += n
    end
  end

end