require_relative './dish.rb'

class Menu

  DEFAULT_DISHES = "mexican_dishes.csv"
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def show_menu
    load_menu
    @dishes
  end

  private

  def load_menu(filename = DEFAULT_DISHES)
    file = File.open(filename, "r")
    File.foreach(file) do |line|
      name, price, description = line.chomp.split(',')
      @dishes << Dish.new(name, '%.2f' % price, description)
    end
  end

  def print_menu(dishes)
    dishes.each_with_index { |dish,i| p "#{i+1}.#{dish.name},£#{dish.price},#{dish.description}" }
  end

end
