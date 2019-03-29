class Menu
  attr_reader :menu, :order

  def initialize
    @menu = [{ dish: 'fish', price: 5 },
             { dish: 'burger', price: 7 },
             { dish: 'pasta', price: 8 }
            ]
    @order = []
  end

  def list_dishes
    @menu
  end

  def order_dishes(dish)
    item = menu.find { |key| key[:dish] == dish }
    @order << item
  end

end
