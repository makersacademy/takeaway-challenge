require 'dish'

class DishPrinter
  def print(dish)
    raise "Invalid dish" unless dish.is_a? Dish
    puts "#{dish.name}...£%.2f" % dish.price
  end
end
