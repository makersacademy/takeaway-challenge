class Order

  attr_reader :show_menu, :selection
  def initialize
    @show_menu = [{"1": "Garlic Bread with cheese", price: 6},
                  {"2": "Pepperoni", price: 12},
                  {"3": "Hawaiian", price: 11}
                  ]
    @selection = []
  end

  def select_pizza(menu_num)
    @show_menu[menu_num.to_i - 1]
  end
end
