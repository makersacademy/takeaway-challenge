require_relative 'dish'
require_relative 'formatter'

class Menu
  include Formatter

  FILE_ERROR = "No such file."

  def initialize(dish_klass = Dish, dishes_str = nil)
    @dish_klass = dish_klass
    @dishes = []
    @filename = "menu.txt"
    dishes_str = read_file if dishes_str.nil?
    parse_dishes(dishes_str)
  end

  def formatted_dishes
    list = ""
    @dishes.each_with_index do |dish, index|
      num = (index).to_s
      name = dish.name
      price = pound_str(dish.price)
      list << three_col_str(num, name, price)
    end
    list
  end

  def dishes
    @dishes.dup
  end

  private

  def read_file
    raise FILE_ERROR unless File.exist?(@filename) && File.file?(@filename)
    contents = ''
    file = File.open(@filename, 'r')
    while !(line = file.gets).nil?
      contents << line.chomp + '/'
    end
    return contents
  end

  def parse_dishes(dishes_str)
      dishes_str_arr = dishes_str.split('/')
      @dishes = dishes_str_arr.map do |str|
         arr = str.split(',')
         @dish_klass.new(arr[0], arr[1].to_f)
      end
  end

end
