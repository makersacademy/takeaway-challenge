DISHES = {
  'Spaghetti Al Pomodoro Fresco E Basilico' => 9.50,
  'Spaghetti Carbonara' => 9.50,
  'Spaghetti Alla Bolognese' => 8.50,
  'Penne All’Arrabiata' => 8.95,
  'Fettuccine Al Salmone' => 10.95,
  'Lasagne Al Forno' => 10.50,
  'Tagliata Di Manzo Con Rucola' => 16.95,
  'Scaloppine Melanzane' => 15.95
  }

class Menu
  attr_reader :dishes

  def initialize(dishes: DISHES)
    @dishes = dishes
  end

  def show
    items = dishes.map { |item, price| "#{item}: £#{price}"}
    "Menu\n\n#{items.join("\n")}"
  end
end
