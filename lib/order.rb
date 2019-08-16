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
    hash2 = hash.merge({quantilty:quantity})
    @selected << hash2
    @prices.push(hash[:price]*quantity)
  return @selected
  end
end
end

def total
  @prices.inject(:+)
end

def done 
  puts "Thank you! Your order was placed and will be delivered before 18:52"
end
end
