class Order

  MENU = {
    'curry goat': 9,
    'brown stew chicken': 8,
    'jerk chicken': 8,
    'steamed fish': 7,
    'vegetable curry': 6,
    'brown rice': 4,
    'white rice': 4,
    'roti': 5,
    'salad': 4,
    'fried dumplings': 3,
    'coleslaw': 2
  }

  def initialize
    @basket = []
  end

  def see_menu
    MENU
  end

  def add_to_basket(menu_item, quantity)
    @basket << { item: menu_item.to_sym, qty: quantity }
  end

  def basket
    @basket.dup
  end

end