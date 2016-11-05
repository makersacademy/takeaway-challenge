class Menu

  attr_reader :dishes

  def initialize(filename)
    @dishes = {}
    load_menu(filename)
  end

  def read_menu
    @dishes
  end

  private

  def load_menu(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      dish, price = line.chomp.split(',')
      @dishes[dish.to_sym] = price.to_i
    end
    file.close
  end

end
