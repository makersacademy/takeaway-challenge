class Order 

  attr_reader :current_items

  def initialize(restaurant)
    @current_items = []
    @restaurant = restaurant
  end

  def add_item(item, quantity)
    @current_items << [item, quantity]
  end

  def submit
    total = 0
    @current_items.each do |order_line|
      price = @restaurant.menu_items[order_line[0]]
      this_line_total = price * order_line[1]
      total += this_line_total
    end
    return total
  end

end

# I would look at each element in the array  
# I'd check the dish's (element[0]) price 
# I'd times that price by the quantity (element[1])
# I'd add that order lines price (food * quantity) to a running total 
# I'd return that total 