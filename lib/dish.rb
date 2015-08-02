class Dish

attr_reader :name, :price

def initialize name, price
@name = name.to_s
@price = price.to_i
end

end