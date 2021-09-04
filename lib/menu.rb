class Menu
  MENU = [{ dish: "Red Curry", price: 6 },
          { dish: "Pad Thai", price: 5 },
          { dish: "Vegetable Spring Roll", price: 1 }]

  def list_of_dishes
    MENU.each_with_index { |dish, ind| 
    puts "#{ind+1}- #{dish[:dish]}: £#{dish[:price]}" }
  end
end