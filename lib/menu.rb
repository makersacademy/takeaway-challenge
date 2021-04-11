require_relative 'dish'

class Menu

  attr_reader :menu_list

  def display_menu
    format_output
  end

  def check(ordered_dish)
    menu_list.each do |item|
      next if item.name != ordered_dish 
      
      return item
    end
  end

  private 

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu_list = []
    load_menu
  end

  def load_menu
    file = File.open("./lib/menu.csv", "r")
    file_open(file)
    file_close(file)
  end

  def file_open(file)
    file.readlines.each do |line|
      name, price, available = line.chomp.split(',')
      dish = @dish_class.new(name, price, available)
      @menu_list << dish
    end
  end

  def file_close(file)
    file.close
  end

  def render_name(dish)
    dish.name.capitalize.gsub('_', ' ')
  end

  def format_output
    @menu_list.each do |dish|
      next if dish.available == "false"

      puts "#{render_name(dish)}: £#{dish.price}" 
    end
  end

end
