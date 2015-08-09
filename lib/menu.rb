class Menu

  attr_reader :dishes

  def initialize
    @dishes = { salmon: 2, tuna: 3, egg: 1.5, squid: 1.8, scallop: 2.8 }
  end

  def show_menu
    puts 'Thank you for checking out our restaurant. Here is our menu:'
    print_menu_dishes
    puts 'Please take your time.'
  end

  private

  def print_menu_dishes
    dishes.each { |food, price| puts "#{food}: £#{price}" }
  end
end
