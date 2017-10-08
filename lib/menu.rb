class Menu
attr_reader :menu_items

  def initialize
    @menu_items = {}

    @main_menu =  {
    "classic margherita": 8.50,
    "pepperoni": 9.95,
    "napoletana": 11.95,
    "quattro stagioni": 11.95,
    "al crudo": 11.95,
    "la ruchetta": 11.95,
    "frutti di mare": 15.95,
    "fiorentina": 11.95,
    "primavera": 14.95,
    "hawaiian": 11.45
    }

    @dessert_menu = {
    "tiramisu": 5.50,
    "chocolate brownie": 3.95,
    "torta della nonna": 3.95,
    "profiteroles": 3.95,
    "lemon cheesecake": 4.95,
    "chocolate ice cream": 5.50,
    "strawberry ice cream": 5.50,
    "vanilla ice cream": 5.50
    }

    @drinks_menu = {
      "water 500ml": 1.50,
      "coca cola": 1.20,
      "diet coke": 1.20,
      "fanta": 1.20,
      "sprite": 1.20
    }
    end

  def view_menu
    dishes = ""
    puts "Pizzas:"
    @main_menu.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
    puts "Desserts:"
    @dessert_menu.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
    puts "Drinks:"
    @drinks_menu.map.each_with_index { |(food, cost), index|
      dishes += p"#{index+1}. #{food}: £#{cost}" }
      dishes
  end

  def menu_items
    @menu_items = [@main_menu, @dessert_menu, @drinks_menu]
    @menu_items.inject(&:merge)
  end

end
