require_relative 'dish.rb'

class ChineseRestaurant 

  DISHES = [  {name: 'Chicken Chow Mein', price: 6.3},
            {name: 'Beef Chow Mein', price: 8.6},
            {name: 'Prawn Chow Mein', price: 9.0},
            {name: 'House Chow Mein', price: 9.9}]

  def menu
    DISHES.map{ |dish| Dish.new(dish[:name], dish[:price]) }
  end

end
