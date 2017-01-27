require 'csv'
require_relative 'dish'

class Menu

  OUTPUT_WIDTH = 60

  attr_reader :dishes

  def initialize(filename = 'menu.csv')
    @filename = filename
    load_menu
  end

  def load_menu(filename = @filename)
    assert_file_exists!(filename)
    load_data_into_hash(filename)
  end

  def print_menu(output_width = OUTPUT_WIDTH)
    print_header(output_width)
    print_body(output_width)
  end

  private

  def load_data_into_hash(filename)
    @dishes = Hash.new
    CSV.foreach(filename) do |row|
      dish = Dish.new
      dish.name, dish.ingredients, dish.price, dish.category  = row[0], row[1], row[2].to_i, row[3]
      @dishes.store(@dishes.length+1,dish)
    end
  end

  def assert_file_exists!(filename)
    message = "Cannot open file: there is no file with this name. Please try another filename."
    raise message if !File.exists?(filename)
  end

  def print_header(output_width)
    puts "Momofuku Noodle Bar, NY".center(output_width),
    "-----------------".center(output_width),
    ""
  end

  def print_body(output_width)
    @dishes.each do |key,dish|
      puts "#{dish.category}".center(output_width),
      "" if if_new_categry_print_its_name(key,dish)
      puts "#{key}:  #{dish.name}, $#{dish.price}".center(output_width),
      "#{dish.ingredients}".center(output_width),
      ""
    end
  end

  def if_new_categry_print_its_name(key,dish)
    @dishes[key-1].nil? or (dish.category != @dishes[key-1].category)
  end

end
