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

  def add(item, qty)
    raise 'Please choose valid menu option' if not_on_menu?(item)
    raise 'Quantity must be a number' if not_a_number?(qty)

    @basket << { item: item.to_sym, qty: qty }
  end

  def basket
    @basket.dup
  end

  private

  def not_on_menu?(item)
    MENU[item.to_sym] == nil
  end

  def not_a_number?(qty)
    ![Integer, Float].include?(qty.class)
  end
end