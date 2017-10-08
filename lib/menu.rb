class Menu
  LIST_OF_DISHES = 'dishes.csv'


  attr_accessor :dishes

  def initialize(dishes = Array.new)
    @dishes = dishes
  end


  def load_menu_from_file(default_file = LIST_OF_DISHES)
    file = File.open(default_file, "r")

    File.foreach(file) do |row|
      name, price = row.chomp.split(',')
      @dishes << Dish.new(name, price)
    end
  end

  def change_menu_to_string
    @dishes.each_with_index.map { |dish, index|
      # dish.to_string(index + 1)
      "#{index + 1}. #{dish.name}, £#{'%.2f' % dish.price}"
    }.join("\n")
  end

end
