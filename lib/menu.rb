class Menu
require 'yaml'

ITEMS = [{category: "Appetiser", description: "Salt and Pepper Prawns", price: 5.00},
         {category: "Appetiser", description: "Chilli King Prawn", price: 5.00},
         {category: "Appetiser", description: "King Prawn Skewers", price: 5.00},
         {category: "Appetiser", description: "Prawn Toast", price: 5.00},
         {category: "Main", description: "King Prawn Chow Mein", price: 5.00},
         {category: "Main", description: "King Prawn Egg Fried Rice", price: 5.00},
         {category: "Appetiser", description: "King Prawn in Black Bean Sauce", price: 5.00},
         {category: "Main", description: "Satay King Prawn", price: 5.00},
         {category: "Appetiser", description: "Wonton King Prawn", price: 5.00},
         {category: "Appetiser", description: "Tempura King Prawn", price: 5.00},
         {category: "Main", description: "Sweet & Sour King Prawn", price: 5.00}]

def list_items
  ITEMS.sort_by! { |hsh| hsh[:category] }
  ITEMS.each_with_index do |elem, index|
    puts "#{index+1}. #{elem[:category]} | #{elem[:description]} | Price: #{elem[:price]}"
  end
end
end