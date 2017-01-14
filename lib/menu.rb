require 'csv'

class Menu

  attr_reader :dishes

  def initialize(filename = 'menu.csv')
    @filename = filename
    load_menu
  end

  def load_menu(filename = @filename)
    file_not_exist?(filename)
    load_data_into_hash(filename)
  end

  private

  def load_data_into_hash(filename)
    @dishes = Hash.new
    dish = Dish.new
    CSV.foreach(filename) do |row|
      dish.name, dish.ingredients, dish.price, dish.type  = row[0], row[1], row[2].to_i, row[3]
      @dishes.store(@dishes.length+1,dish)
    end
  end

  def file_not_exist?(filename)
    message = "Cannot open file: there is no file with this name. Please try another filename."
    raise message if !File.exists?(filename)
  end

#Momofuku Noodle Bar, NY

end
