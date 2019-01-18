class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def load_menu
    file = File.open("./lib/unity_menu.csv", "r")
    file.readlines.each do |line|
      dish, price = line.chomp.split(',')
      @menu << { dish: dish, price: price }
    end
  end
end
