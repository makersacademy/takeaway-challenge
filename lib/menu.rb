class Menu
  attr_reader :menu, :order
  attr_accessor :order

  def initialize
    @menu = [{ dish: 'fish', price: 5, quantity: 0 },
             { dish: 'burger', price: 7, quantity: 0 },
             { dish: 'pasta', price: 8, quantity: 0 }
            ]
    @order = []
  end

  def list_dishes
    @menu.each { |item|
    item[:dish]
    item[:price]
  }
  end

  def order_dishes(dish, quantity = 1)
    item = menu.select{|key, hash| key[:dish] == "fish" }
    puts item
    @order << item
  end

end
