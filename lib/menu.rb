class Menu
require 'yaml'

MENU = [{description: "Salt and Pepper King Prawns", price: 5.00, quantity: 0},
         {description: "Chilli King Prawn", price: 5.00, quantity: 0},
         {description: "King Prawn Skewers", price: 5.00, quantity: 0},
         {description: "Prawn Toast", price: 5.00, quantity: 0},
         {description: "King Prawn Chow Mein", price: 5.00, quantity: 0},
         {description: "King Prawn Egg Fried Rice", price: 5.00, quantity: 0},
         {description: "King Prawn in Black Bean Sauce", price: 5.00, quantity: 0},
         {description: "Satay King Prawn", price: 5.00, quantity: 0},
         {description: "Wonton King Prawn", price: 5.00, quantity: 0},
         {description: "Tempura King Prawn", price: 5.00, quantity: 0},
         {description: "Sweet & Sour King Prawn", price: 5.00, quantity: 0}]

  def initialize
    @menu = MENU
  end

  def print_items
    puts menu_format("Item Number","Description","Price (£)", "Quantity") # add a title to the menu
    @menu.each_with_index do |elem, index|
      puts menu_format(index+1, elem[:description],elem[:price],elem[:quantity]) # loop through the elements and print to screen
    end
  end

  def menu_format(item_num, description, price, quantity) #POTENTIALLY A NEW CLASS
    item_str = item_num.to_s.ljust(15)
    description_str = description.to_s.ljust(40)
    price_str = price.is_a?(Float) ? sprintf("%.2f", price).ljust(10) : price.ljust(10) #differentiate title (String) and price (Float)
    quantity_str = quantity.to_s.ljust(10)
    item_str+description_str+price_str+quantity_str #concatenate
  end

  def menu_price_diff(item_num, price)
    @menu[item_num-1][:price] == price
  end
end

menu = Menu.new

menu.print_items