require 'csv'

class Menu

  OUTPUT_WIDTH = 60

  attr_reader :dishes

  def initialize(filename = 'menu.csv')
    @filename = filename
    load_menu
  end

  def load_menu(filename = @filename)
    file_not_exist?(filename)
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
      dish.name, dish.ingredients, dish.price, dish.type  = row[0], row[1], row[2].to_i, row[3]
      @dishes.store(@dishes.length+1,dish)
    end
  end

  def file_not_exist?(filename)
    message = "Cannot open file: there is no file with this name. Please try another filename."
    raise message if !File.exists?(filename)
  end

  def print_header(output_width)
    puts "Momofuku Noodle Bar, NY".center(output_width),
    "-----------------".center(output_width),
    ""
  end

  def print_body(output_width)
    @dishes.each do |key,value|
      puts "#{value.type}".center(output_width),
      "" if @dishes[key-1].nil? or (value.type != @dishes[key-1].type)
      puts "#{key}:  #{value.name}, $#{value.price}".center(output_width),
      "#{value.ingredients}".center(output_width),
      ""
    end
  end

end
