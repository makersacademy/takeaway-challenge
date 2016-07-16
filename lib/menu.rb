class Menu

attr_reader :menu

MENU = {
         'Edamame' => 1.95,
         'Takoyaki' => 5.95,
         'Okonomiyaki' => 6.95,
         'Yakitori'=> 4.95,
         'Sashimi Salad' => 10.95,
         'Mixed Tempura' => 6.95,
         'Sushi set' => 11.95,
         'Rice' => 1.95,
}

  def initialize(menu)
     @menu = menu
  end

  def show_menu
    @menu
  end

  def has_dish(dish)
    @menu.has_key?(dish)
  end

  def dish_price(dish)
    @menu.values_at(dish).last
  end

end
