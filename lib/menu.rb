class Menu
  attr_reader :menu

  def initialize
    @menu = { burger: 3, cheeseburger: 4, chips: 2 }
  end

  def print_menu
    puts "Our menu is:"
    @menu.each { |x, y| puts "#{x}, £#{y}" }
  end
end
