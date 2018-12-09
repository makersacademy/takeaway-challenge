class Menu
  # menu shows list

  def initialize
    @menu = []
  end

  def load_menu
    dishes = File.open("./lib/pizza_menu.csv", "r")
    dishes.readlines.each_with_index do |line|
      name, description, price = line.chomp.split(',')
      @menu << { name: name, description: description, price: price}
    end
    puts @menu
  end
end
