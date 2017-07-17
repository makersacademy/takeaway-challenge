class Menu

  attr_reader :dishes

  def initialize
    @dishes = { Margherita: 7.95,
       Tropicana: 10.80,
       Fiorentina: 9.90 }
  end

  def print_menu
    puts "--------MENU--------".center(70)
    puts "--------------------".center(70)
    puts dishes.map { |name, price| "#{name.capitalize} £#{price}".center(70) }
  end

  def dish_included?(name)
    dishes.has_key?(name.capitalize)
  end

end
