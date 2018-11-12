class Menu
DELIVERY_CHARGE = 2.50
  def initialize(menu = [{"Mouse stew" => 13},
    {"fish pizza" => 12},
    {"kirill kebab" => 7},
    {"rat stew" => 6},{"avocado on toast" => 3}])
    @menu = menu
    @basket = []
    @menu_prices = {"Mouse stew" => 13,
    "fish pizza" => 12,
    "kirill kebab" => 7,
    "rat stew" => 6,"avocado on toast" => 3}
  end
  def select
    @order = @menu[0..2]
  end
  def menu
    @menu
  end
  def view
    @menu[0..2]
  end

  def save_to_basket
    @basket << @menu[0..2]
  end
  def total
    @menu_prices["Mouse stew"] + @menu_prices["fish pizza"] + @menu_prices["kirill kebab"] + DELIVERY_CHARGE



  end

end
