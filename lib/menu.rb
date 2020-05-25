class Menu

  attr_reader :list_of_dishes
  DEFAULT_MENU = { "chicken tikka": 9, "beef madras": 10, "vegetable vindaloo": 8 }

  def initialize(list = DEFAULT_MENU)
    @list_of_dishes = list
  end

  def print_menu
    puts "\nMenu\n\n"
    @list_of_dishes.each { |dish, price|
      puts "#{dish}........£#{price}"
    }
    puts "\n"
  end

  def on_menu?(dish)
    @list_of_dishes.has_key?(dish.to_sym)

  end

end
