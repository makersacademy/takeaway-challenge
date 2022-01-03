require './lib/dish'
require './lib/order'

class Takeaway
  attr_reader :menu_list
  
  def initialize(name)
    @name = name
    @menu_list = []
    load_menu(name)
  end

  def show_menu
    dishes = []
    @menu_list.each { |dish| dishes << "#{dish.name} - #{dish.price}" } 
    dishes.join(', ')
  end

  def make_order
    Order.new(@menu_list)
  end
  
  private

  def load_menu(name)
    path = "./lib/menus/#{name}.csv"
    raise 'No menu to load' unless File.exist?(path)
    csv_lines = File.open(path, 'r') { |file| file.readlines }
    csv_lines.each { |csv_lines| name, price = csv_lines.split(','); add_dish(Dish.new(name, price.strip.to_i))  }
  end
  
  def add_dish(dish)
    @menu_list << dish
  end
end
