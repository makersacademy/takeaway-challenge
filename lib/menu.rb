class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
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
