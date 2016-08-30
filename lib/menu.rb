class Menu

attr_reader :printed_menu, :menu

  def initialize
  @menu = todays_menu
  @printed_menu = []
  end

  def todays_menu
    {Chicken: 3.50,
    Noodles: 3.50,
    Salad: 4.00,
    Cake: 2.50}
  end

  def print_menu
    todays_menu.each_pair do |dish,price|
      printed_menu << "#{dish}: £#{price}0"
    end
    printed_menu.join(", ")
  end

  def find_cost(dish)
    menu[dish.to_sym]
  end

end
