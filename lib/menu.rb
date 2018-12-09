class Menu

  attr_reader :list

  def initialize(filename = "./lib/menu.csv")
    @filename = filename
    @list = []
    load_list
  end

  def load_list
    file = File.open(@filename, "r")
    file.readlines.each { |line|
      item, price = line.chomp.split(',')
      @list << ({ item: item, price: price })
    }
  end

end
