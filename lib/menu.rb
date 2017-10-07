class Menu

    MAIN_MENU =  {
    "classic margherita": 8.50,
    "pepperoni": 9.95,
    "napoletana": 11.95,
    "quattro stagioni": 11.95,
    "al crudo": 11.95,
    "la ruchetta": 11.95,
    "frutti di mare": 15.95,
    "fiorentina": 11.95,
    "primavera": 14.95,
    "hawaiian": 11.45,
    }

    DESSERT_MENU = {
    "tiramisu": 5.50,
    "chocolate brownie": 3.95,
    "torta della nonna": 3.95,
    "profiteroles": 3.95,
    "lemon cheesecake": 4.95,
    "chocolate ice cream": 5.50,
    "strawberry ice cream": 5.50,
    "vanilla ice cream": 5.50
    }

    DRINKS_MENU = {
      "water 500ml": 1.50,
      "coca cola": 1.20,
      "diet coke": 1.20,
      "fanta": 1.20,
      "sprite": 1.20,
    }

  def view_menu
    dishes = ""
    puts "Pizzas:"
    MAIN_MENU.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
    puts "Desserts:"
    DESSERT_MENU.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
    puts "Drinks:"
    DRINKS_MENU.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
      dishes
  end

  def menu_items
    dishes = ""
      MAIN_MENU.map.each { |food, cost| dishes += "#{food}: £#{cost} " }
      DESSERT_MENU.map.each { |food, cost| dishes += "#{food}: £#{cost} " }
      DRINKS_MENU.map.each { |food, cost| dishes += "#{food}: £#{cost} " }
    dishes
  end

end
