require_relative 'dish'
require_relative 'formatter'

class Menu
  include Formatter

  def initialize(dish_klass = Dish, file_klass = File)
    @dish_klass = dish_klass
    @dishes = []
    file = file_klass.open("menu.txt", 'r')
    menu_str = read_from_file(file)
    parse_dishes(menu_str)
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

  def read_from_file(file)
    contents = ''
    until (line = file.gets).nil?
      contents << line.chomp + '/'
    end
    contents
  end

  def parse_dishes(dishes_str)
      dishes_str_arr = dishes_str.split('/')
      @dishes = dishes_str_arr.map do |str|
         arr = str.split(',')
         @dish_klass.new(arr[0], arr[1].to_f)
      end
  end

end
