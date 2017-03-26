require_relative 'dish'

class Menu
  #loads a list of dishes from a CSV file

  attr_reader :dishes

  def initialize(filename)
    @dishes = {}
    key = 1
    opened_menu_file = File.open(filename, 'r')
    opened_menu_file.readlines.each do |line|
      name, price = line.chomp.split(',')
      dish = Dish.new(name,price)
      @dishes[key] = dish
      key += 1
    end
    opened_menu_file.close
  end

end
