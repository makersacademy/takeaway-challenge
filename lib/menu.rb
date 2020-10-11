class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
      "hamburger" => 1.99,
      "chicken nuggets" => 2.99,
      "double cheeseburger" => 1.99,
      "fries" => 1.29,
      "milkshake" => 2.09
    }
  end

  def prettify_menu_list
    @menu_list.each do |meal, price|
      puts "#{meal}: £#{price}\n".capitalize
    end
  end
end
