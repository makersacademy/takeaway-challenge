class Menu

attr_reader :dishes

def initialize
  @dishes = {
    "Cassoulet" => 11,
    "Pan bagnat" => 9,
    "Pasta arrabiatta" => 10
    }
end

def print
@dishes.each { |name, price| puts "#{name}: £#{price}"}
end

def price(dish_name)
  @dishes[dish_name]
end

end