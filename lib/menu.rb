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

  def print_items
    ITEMS.sort_by! { |hsh| hsh[:category] } #sort hashes by Appetiser > Main
    puts menu_format("Item Number","Category","Description","Price (£)") # add a title to the menu
    ITEMS.each_with_index do |elem, index|
      puts menu_format(index+1,elem[:category], elem[:description],elem[:price]) # loop through the elements and print to screen
    end
  end

  def menu_format(item_num, category, description, price)
    item_str = item_num.to_s.ljust(15)
    category_str = category.to_s.ljust(15)
    description_str = description.to_s.ljust(40)
    price_str = price.is_a?(Float) ? sprintf("%.2f", price).ljust(10) : price.ljust(10) #differentiate title (string) and price (float)
    item_str+category_str+description_str+price_str #concatenate
  end

  def compare_items(item_num, cost)

  end
end