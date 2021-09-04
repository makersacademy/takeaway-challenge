class Menu
  attr_reader :list

  def initialize
    @list = []
    load_dishes
  end

  def load_dishes(filename = "./lib/dishes.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line| 
      dish, cost = line.chomp.split(",")
      @list << { dish => cost.to_i }
    end
    file.close
  end
end
