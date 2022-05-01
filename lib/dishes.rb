class Dishes
  attr_reader :menu
  
  def initialize
    @menu = {
      "Diet (not really) Pizza" => 5.99,
      "Make me fat Pizza" => 6.99,
      "Easy-Peasy Pizza" => 7.99,
      "Hold my beer Pizza" => 8.99,
      "Once in a lifetime Pizza" => 9.99
    }
    @available = true
  end

  def show_dishes
    @menu.each { |meal, price| puts "#{meal} £#{price}" }
  end

  def dish_available?
    @available
  end
end
