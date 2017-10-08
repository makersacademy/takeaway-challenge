require File.dirname(__FILE__) + '/dish'
class DishListParser
  
  private
  attr_reader :filename
  attr_writer :list
  
  public
  attr_reader :list

  def initialize(filename = File.dirname(__FILE__) + "/../data/dishes.csv")
    @filename = filename
    @list = []
  end

  def parse_from_file(delimiter = ",")
    File.open(filename, "r") do |infile|
      while (line = infile.gets)
        name, price = line.chomp.split(delimiter)
        list << Dish.new(name: name, price: price.to_f)
      end
    end
  end
end
