require_relative 'dish'

class Menu
  attr_reader :list

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @list = []
    load_menu
  end

  def show
    print_menu
  end

  private

  def load_menu
    file = File.open("./lib/data.csv", "r")
    file.readlines.each do |line|
      name, price, available = line.chomp.split(',')
      dish = @dish_class.new(name, price, available)
      @list.push(dish)
    end
    file.close
  end

  def print_menu
    @list.each do |dish|
      next if dish.available == "false"
      puts "#{dish.name.capitalize}: £#{dish.price} (#{dish.available})"
    end
  end
end
