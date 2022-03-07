class Menu
  attr_reader :menu

  def initialize
    @menu = {
      "Pizza" => 8,
      "Burger" => 9,
      "Pasta" => 6,
      "Special Fried Rice" => 5.5,
      "Kebab" => 6.5,
      "Ice Cream" => 3.2,
      "Chocolate Cake" => 2,
    }
  end

  def see_menu
    @menu.each { |dish, price| puts "#{dish} - £#{price}" }
  end
end
