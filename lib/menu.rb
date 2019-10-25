class Dish
  attr_reader :dishes
  def initialize
    @dishes = [
      {name: 'Chicken Curry', price: 5.00},
      {name: 'Beef Madras', price: 5.50},
      {name: 'Rice', price: 1.00},
      {name: 'Chips', price: 1.50},
      {name: 'Pizza', price: 10.00},
      {name: 'Hamburger', price: 2.50},
      {name: 'Garlic Bread', price: 4.00},
      {name: 'Naan Bread', price: 2.50},
      {name: 'Pasta Salad', price: 6.00},
      {name: 'Sushi', price: 10.00},
      {name: 'Hot Dog', price: 3.00}
    ]
  end
end

class Menu
  attr_reader :menu
  def initialize
    menu_items = Dish.new
    @menu = menu_items.dishes
  end

  def show_menu
    menu_display = menu.map {|x| x.values}
    print menu_display
    return menu_display
  end
end

help = Menu.new

help.show_menu
