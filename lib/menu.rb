require_relative "order"
class Menu
 attr_reader :options


def items_on_menu
 @options = {"Crispy Pancake Rolls" => 3.20,
"Aromatic Duck" => 7.70,
"Satay Chicken" => 4.70,
"Grilled Meat Dumplings" => 3.80,
"Won Ton Soup" => 3.20,
"Smoked Shredded Chicken" => 6.40,
"Sweet and Sour Chicken" => 5.50,
"Special Fried Rice" => 4.80}
end



end
