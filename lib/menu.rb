class ListofDishes
  attr_reader :menu
  def initialize
    @menu = [{ dish: "Pierogi (dumplings)", price: 7.95 },
             { dish: "Bigos", price: 5.45 },
             { dish: "Golonka (ham hock)", price: 9.95 },
             { dish: "Krokiety (croquettes)", price: 8.45 },
             { dish: "Mushroom Soup", price: 2.95 },
             { dish: "Grilled Trout with mashed potatos", price: 11.95 },
             { dish: "Gulasz stew", price: 13.95 }]
  end

  def see_list
    @menu.each { |dish| puts "#{@menu.index(dish) + 1}. #{dish[:dish]}, price: £#{dish[:price]}" }
  end
end
