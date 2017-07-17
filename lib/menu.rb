class Menu

  attr_reader :dishes

  def initialize
    @dishes = { Margherita: 7.95,
       Tropicana: 10.80,
       Fiorentina: 9.90 }
  end

  def print_menu
    puts "------MENU------"
    puts "----------------"
    puts dishes.map { |name, price| "#{name.capitalize} £#{price}" }
  end

  def dish_included?(name)
    dishes.has_key?(name.capitalize)
  end

end
