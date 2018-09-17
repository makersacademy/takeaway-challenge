class Menu

  attr_reader :menu

  PIZZA_MENU = [
    { dish: "margherita", price: 8 },
    { dish: "pepperoni",  price: 10 },
    { dish: "meatfeast",  price: 15 },
  ]

  def initialize(menu = PIZZA_MENU)
    @menu = menu
  end

  def display_menu
    @menu.each do |menu_item|
       display_item(menu_item)
    end
  end

  def dish_avaliable?(dish)
    @menu.each do |menu_item|
      return true if on_the_menu?(menu_item, dish)
    end
    false
  end


  def price(dish)
    @menu.each do |menu_item|
      return menu_item[:price] if on_the_menu?(menu_item, dish)
    end
  end

  def display_item(menu_item)
    puts ("#{menu_item[:dish]} #{menu_item[:price]}")
  end

  def on_the_menu?(menu_item, dish)
     menu_item[:dish] == dish.downcase
  end
end
