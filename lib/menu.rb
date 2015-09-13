class Menu

attr_reader :list_menu

def initialize
@menu = { 'Plantain fries'=> 3,
          'Banana Curry'=> 8,
          'Banoffee Pie'=> 5,
          'Banana Milkshake' => 3}
end

def list_menu
  list = []
  @menu.each { |dish, price| list << "#{dish}....£#{price}"}
  list
end


end
