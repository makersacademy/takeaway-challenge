require 'csv'

class Takeaway
  MENU = []
  CSV.foreach('./docs/menu.csv') do |line|
    dish, price = line
    MENU << { dish: dish, price: price }
  end

  def show_menu
    MENU
  end

  def order(dish, amount = 1)
    "#{amount} x #{dish}"
  end
end
