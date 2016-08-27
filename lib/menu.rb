class Menu

attr_reader :menu

MENU = {
         'edamame' => 1.95,
         'takoyaki' => 5.95,
         'okonomiyaki' => 6.95,
         'yakitori'=> 4.95,
         'sashimi salad' => 10.95,
         'mixed tempura' => 6.95,
         'sushi set' => 11.95,
         'rice' => 1.95,
}
  def initialize
     @menu = MENU
  end

  def show_menu
    @menu
  end

  def has_dish?(dish)
    @menu.has_key?(dish)
  end

  def dish_price(dish)
    "£#{@menu.values_at(dish).last}"
  end

end
