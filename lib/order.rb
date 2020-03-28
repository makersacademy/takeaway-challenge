class Order

  attr_reader :show_menu
  def initialize
    @show_menu = [{"1": "Garlic Bread with cheese", price: 6},
                  {"2": "Pepperoni", price: 12},
                  {"3": "Hawaiian", price: 11}
                  ]
  end

  def add_pizza(menu_num)
    @show_menu[menu_num]
  end

end
