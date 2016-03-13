require_relative 'dish'

class Menu

  attr_reader :contents

  def initialize
    @contents = { beef: Dish.new('Beef Shindaloo', 11),
                  fish: Dish.new('Monkfish Madras', 13),
                  dahl: Dish.new('Mustard Dahl', 9),
                  rice: Dish.new('Cardamom Rice', 6)  }
  end

  def show_menu
    @contents.each { |a, b, c, d, e, f|
      puts "Dish: #{a}"
      puts "Price: #{b}"
      puts " "
    }
  end
  def place_order(argument)
    @contents[argument]
  end

  def review(food_item)
    @contents[food_item].price
  end

end
