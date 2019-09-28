
class Menu 

  def initialize
    @dishes = []
  end

  def list
    output = ""
    @dishes.each do |dish|
      dish_name = dish[:name]
      dish_price = (dish[:price] / 100) # convert from pennies
      output += "#{dish_name} (£#{dish_price})\n"
    end
    return output
  end

  def add(dish, price)
    @dishes << {name: dish, price: price}
  end
end
