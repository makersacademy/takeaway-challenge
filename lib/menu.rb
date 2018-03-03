require_relative './dish.rb'
require_relative './dish_printer.rb'

class Menu

  def initialize(dish_class=Dish, printer=DishPrinter.new)
    @dish_class = dish_class
    @dish_array = []
    @printer = printer
  end

  def add_dish(name, price)
    @dish_array << @dish_class.new(name, price)
  end

  def populate_dishes_from_array(input_dish_array)
    input_dish_array.each do |x|
      add_dish(x[0], x[1])
    end
  end

  def print(puts_out=true)
    if puts_out
      puts @printer(dish_array)
    else
      @printer(dish_array)
    end
  end

  def select(i, n)
    Array.new(n) { @dish_array[i - 1] }
  end

end
