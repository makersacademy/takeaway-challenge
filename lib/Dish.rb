class Dish

attr_reader :dishes, :dish_name, :dish_price

def initialize
    @dish_name = 'cassoulet'
    @dish_price = '£10'
    @dishes = [{dish_name: @dish_name, dish_price: @dish_price}]
end

def dishes
  @dishes
end

def dish_name
@dish_name
end

end