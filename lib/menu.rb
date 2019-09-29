class Menu
  attr_reader :items

  def initialize
    @items = [{ dish: "Pizza", cost: 6 }, { dish: "Burger", cost: 5 },
             { dish: "Fries", cost: 3 }, { dish: "Milkshake", cost: 3 },
             { dish: "Soda", cost: 1 }]
  end

  def view_items
    print "MENU:\n" + @items.map {
      |item| "#{item[:dish]} -- £#{item[:cost]}"
    }.join("\n")
  end

end
