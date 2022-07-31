class Menu
  attr_reader :list

  def initialize
    @list = []
    load_dishes
  end

  def load_dishes(filename = "./lib/dishes.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line| 
      dish_number, dish, cost = line.chomp.split(",")
      @list << { dish_number: dish_number.to_i, dish: dish, cost: cost.to_i }
    end
    file.close
  end
end
