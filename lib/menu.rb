class Menu 
  MENU = [{ name: "Peking Duck", price: 3.99},
          {name: "Egg Fried Rice", price: 2.99},
          {name: "Dumpling", price: 1.99},
          {name: "Chicken Katsu", price: 4.99}]
  
  def print_dish
    MENU.each { |dish| puts "#{dish[:name]}: £#{dish[:price]}"}
  end
end