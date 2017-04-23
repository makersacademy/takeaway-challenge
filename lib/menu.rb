class Menu

  attr_reader :menu_items

  DEFAULT_MENU = {
  Hamburger: 4.00,
  Cheeseburger: 4.50,
  Hot_Dog: 3.50,
  Mac_n_Cheese: 3.00,
  Fries: 2.00,
  Onion_Rings: 2.00,
  Salad: 2.00,
  Milkshake: 2.50,
  Soda: 1.50
  }

  def initialize(menu_items = DEFAULT_MENU)
    @menu_items = menu_items
  end

  def print_menu
    menu_items.map do |item, price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

  def in_menu?(item)
    !!menu_items[item]
  end

  def price(item)
    menu_items[item]
  end

end
