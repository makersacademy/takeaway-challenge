class Order
attr_reader :dishes, :selected, :prices
def initialize(menu=Menu.new)
  @dishes = menu.dishes
  @selected = []
  @prices =[]
end

def select(dish,quantity)
  @dishes.select do |hash|
  if  hash[:dish] == dish
    hash2 = hash.merge({quantity:quantity})
    @selected << hash2
    @prices.push(hash[:price]*quantity)
  return @selected
  end
end
end

def total
  @total = @prices.inject(:+)
end

def done(order)
  amount = @selected.map {|hash| hash[:price]*hash[:quantity]}.inject(:+)
  if @total != amount
    raise "Total is not correct!"
  else
  puts "Thank you! Your order was placed and will be delivered before 18:52"
  return @selected << [{total: total}]
  end
end

end
