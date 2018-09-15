class Menu
  attr_reader :menu_items

  DEFAULT_MENU = [{ name: "Spaghetti and Meatballs", price: 5.00 },
                  { name: "Chicken curry",           price: 7.00 },
                  { name: "Chop Suey",               price: 8.00 },
                  { name: "Pepperoni Pizza",         price: 6.99 },
                  { name: "Pho",                     price: 9.50 },
                  { name: "Fried Chicken",           price: 4.50 },
                  { name: "Pad Thai",                price: 9.50 },
                  { name: "Hawaiian Pizza",          price: 5.50 },
                  { name: "Massaman Curry",          price: 8.25 }
                  ]

  def initialize(menu_items: DEFAULT_MENU)
    @menu_items = menu_items
  end

  def add_item(dish, price)
    @menu_items << { name: dish, price: price }
  end

  def display_menu
    @menu_items.each do |dish|
      puts "#{dish[:name]}: #{num_to_currency(dish[:price])}"
    end
  end

  def on_the_menu?(dish)
    menu_names = @menu_items.map { |item| item[:name] }
    menu_names.include?(dish)
  end

  def search_menu(dish_name)
    @menu_items.select { |item| item[:name] == dish_name }[0]
  end

  private

  def num_to_currency(price)
    sprintf("£%2.2f", price)
  end
end
