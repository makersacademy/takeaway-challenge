class Menu


  attr_reader :foods

  def initialize
    @foods = { "pizza" => 7.99,
              "pasta" => 7.50,
              "steak" => 11.99,
              "pint" => 3.99 }
  end

  def read_menu
    p "Here is the menu for our restaurant"
    @foods.each { |item, price| p "#{item}: £#{price}" }
  end

end
