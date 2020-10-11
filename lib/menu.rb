class Menu
  attr_reader :list

  def initialize
    @list = {
      "hamburger" => 0.99,
      "chicken nuggets" => 2.99,
      "double cheeseburger" => 1.99,
      "fries" => 1.29,
      "milkshake" => 2.09
    }
  end

  def prettify_list
    @list.each do |meal, price|
      puts "#{meal}: £#{price}\n"
    end
  end
end
