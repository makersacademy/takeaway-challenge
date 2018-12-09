class Menu
  # menu shows list

  attr_reader :filename, :loaded_menu, :list

  def initialize(filename = './lib/pizza_menu.csv')
    @filename = filename
    @loaded_menu = []
    load_menu
  end

  def load_menu
    dishes = File.open(filename, "r")
    dishes.readlines.each do |line|
      name, description, price = line.chomp.split(',')
      loaded_menu << { name: name, description: description, price: price }
    end
  end

  def show
    @list = []
    loaded_menu.each.with_index do |item, index|
      @list << "#{index + 1}. #{item[:name]}: #{item[:description]} £#{item[:price]}"
    end
    @list
  end
end
