require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @customer_order = []
    @menu = menu
  end

  def view_menu
    @menu.view_menu
  end

  def view_order
    @customer_order
  end

  def add_dish(dish, quantity = 1)
    if dish == "cod"
      @customer_order.push([dish, quantity])
    end
  end

end


#haddock: 7,
#cod: 6,
#scampi: 5,
#large_chips: 3,
#small_chips: 2
