class Menu

  attr_reader :menu

  def initialize
    @menu = {
              "Prawn crackers" => 2.00,
              "Summer Roll" => 4.50,
              "Spring Rolls" => 3.99,
              "Pho" => 10.99,
              "Bun Thit Nuong" => 9.50,
              "Seafood Stir Fry" => 13.99,
              "Coke" => 1.50,
              "Water" => 1.25
            }
  end

  def read_menu
    @menu.each do |item, price|
      puts "#{item}: £#{sprintf("%.2f", price)}"
    end
  end
end
