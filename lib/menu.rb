
class Menu

MENU = {
  'Bruschetta' => 5,
  'Garlic Bread' => 4,
  'Calamari' => 5,
  'Olives' => 3,
  'Margherita Pizza' => 8,
  'Pepperoni Pizza' => 10,
  'Spaghetti Bolognese' => 9,
  'Carbonara' => 9,
  'Penne Arrabbiata' => 8,
  'Lasagne' => 12,
  'Tiramisu' => 7,
  'Raspberry Sorbet' => 6
}

attr_reader :menu

def initialize(menu = MENU)
  @menu = menu
end

def print_menu
  puts "Menu:"
  @menu.map { |dish, price| puts "#{dish}: £#{price}" }
end


end