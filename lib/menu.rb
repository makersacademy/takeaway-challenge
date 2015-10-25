require_relative 'dish'
require_relative 'formatter'

class Menu
  include Formatter

  def initialize(dish_klass = Dish, dishes_str = nil)
    @dish_klass = dish_klass
    @dishes = Array.new
    filename = "menu.txt"
    dishes_str = read_file(filename) if dishes_str.nil?
    parse_dishes(dishes_str)
  end

  def formatted_dishes
    list = ""
    @dishes.each_with_index do |dish, index|
      num, name, price = (index).to_s, dish.name, dish.price.to_s
      list << three_col_str(num, name, price)
    end
    list
  end

  def dishes
    @dishes.dup
  end

  private

  def read_file(filename)
    if File.exist?(filename) && File.file?(filename)
      contents = ''
      file = File.open(filename, 'r')
      while (line = file.gets) != nil
        contents << line.chomp + '/'
      end
      return contents
    end
  end

  def parse_dishes(dishes_str)
      dishes_str_arr = dishes_str.split('/')
      @dishes = dishes_str_arr.map do |str|
         arr = str.split(',')
         @dish_klass.new(arr[0], arr[1].to_f)
      end
  end

end
