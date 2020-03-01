class Menu
  attr_reader :menu
  def initialize
    @menu = {
    "Borscht" => 10,
    "Olivier" => 11,
    "Frikadelka" => 6,
    "Vinegret" => 9,
    "Shuba" => 10,
    "Russian Trio" => 23,
    "Eggplant Caviar" => 10,
    "Chicken Kiev" => 22,
    "Duck a la Russe" => 22,
    "Tabaka" => 21,
    "Vodka" => 5
  }
  end

  def show_menu
    @menu.each { |dish, price| puts "#{dish}: £#{price}" }
  end
end
