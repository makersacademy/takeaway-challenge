class Menu
require 'yaml'

ITEMS = [{category: "Appetiser", description: "Salt and Pepper Prawns", price: 5.00},
         {category: "Appetiser", description: "Prawn Toast", price: 5.00},
         {category: "Main", description: "King Prawn Chow Mein", price: 5.00},
         {category: "Main", description: "King Prawn Egg Fried Rice", price: 5.00},
         {category: "Appetiser", description: "King Prawn in Black Bean Sauce", price: 5.00}]

def list_items
  ITEMS.each_with_index do |elem, index|
    puts "#{index+1}. #{elem[:category]} | #{elem[:description]} | Price: #{elem[:price]}"
  end
end
end

menu = Menu.new
menu.list_items