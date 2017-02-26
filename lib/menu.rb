class Menu

attr_reader :dishes

def initialize
  @dishes = { "Pizza" => 7.5,
              "Spaghetti" => 6.0,
              "Salad" => 4.0,
              "Burger" => 7.0,
              "Fries" => 3.0,
              "Juice" => 2.5,
              "Water" => 1.0}
end

def check_menu(item)
  fail 'This item is not on the menu' unless @dishes.key? item
end

def price(item)
  @dishes[item]
end

end
