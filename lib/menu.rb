class Menu
  FILENAME = "./lib/list_dishes.csv"

  attr_reader :list

  def initialize(list = Array.new)
    @list = list
  end

  def printer
    load_dishes
  end

  private
  def load_dishes
    File.open(FILENAME, "r") do |file|
      file.readlines.each do |line|
        list_unit = []
        dish, price = line.chomp.split(',')
        list_unit = {:dish => dish, :price => price.to_i}
        get_dish(list_unit)
      end
    end
    list
  end

  def get_dish(list_unit)
    @list << list_unit
  end
end
