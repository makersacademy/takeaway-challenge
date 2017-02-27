require_relative './dish.rb'

class Dishes

  DEFAULT_DISHES_FILE = "appfiles/dish_file.csv"

  attr_reader :list

  def initialize(file = DEFAULT_DISHES_FILE)
    @list = []
    dish_file = File.new(file, "r")
    import_dishes_from_file(dish_file)
  end

 private

  def import_dishes_from_file(file)
    File.foreach(file) do |line|
      name, price = line.chomp.split(",")
      @list << Dish.new(name, '%.2f' % price)
    end
  end

end
