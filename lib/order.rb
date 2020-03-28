class Order

  attr_reader :show_menu
  def initialize
    @show_menu = [{one: "Garlic Bread with cheese", price: 6},
                  {two:"Pepperoni", price: 12},
                  {three: "Hawaiian", price: 11}
                  ]
  end
  #def show_menu

  #end
end
