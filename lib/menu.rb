require_relative "./dish.rb"
require "csv"

class Menu
  attr_reader :dishes
  DEFAULT_MENU = "menu.csv"

  def initialize(dish_class = Dish)
    @dishes = []
    load_csv(DEFAULT_MENU, dish_class)
  end

  def get_by_id(given_id) # will give a COPY of the dish with the given id
    @dishes.select { |dish| dish.id == given_id }.pop
  end

  def list
    dishes.each { |dish| puts dish.print_dish }
  end

  def load_csv(file_name, dish_class)
    if File.exist?(file_name)
      CSV.open(file_name, "r") do |newfile|
        newfile.readlines.each do |line|
          @dishes << dish_class.new(line[0].to_i, line[1].to_s, line[2].to_i)
        end
      end
    else
      puts "ERROR"
    end
  end
end
