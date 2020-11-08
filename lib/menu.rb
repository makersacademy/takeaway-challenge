class Menu

  MENU = {
    'curry goat': 9.00,
    'brown stew chicken': 8.00,
    'jerk chicken': 8.00,
    'steamed fish': 7.00,
    'vegetable curry': 6.00,
    'rice and peas': 4.50,
    'plain rice': 4.50,
    'roti': 5.00,
    'salad': 4.00,
    'fried dumpling': 1.50,
    'coleslaw': 1.00,
    'beef patty': 2.50,
    'lamb patty': 2.50,
    'chicken patty': 2.50,
    'saltfish patty': 2.50,
    'veg patty': 2.50
  }

  def dishes
    MENU
  end

  def user_menu
    MENU.each do |item, price|
      puts "#{item}, #{price_format(price)}"
    end
  end

  private

  def price_format(num)
    "£#{sprintf('%.2f', num)}"
  end
end