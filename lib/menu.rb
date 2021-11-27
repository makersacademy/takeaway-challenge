class Menu
  def initialize
    @dishes = [
      { dish: "marinara", price: "£5.50" },
      { dish: "margherita", price: "£6.50" },
      { dish: "pepperoni", price: "£8" },
      { dish: "capricciosa", price: "£10" },
      { dish: "bufala", price: "£11" }
    ]
  end

  def list_dishes
    @dishes.map do |dish|
      "#{dish[:dish]} #{dish[:price]}"
    end
  end

  def select_dish(name, quantity = 1)
    @dishes.each do |dish| 
      if dish[:dish] == name
        choice = dish.dup
        choice[:quantity] = quantity
        return choice
      end
    end
    raise "dish not available"
  end

end

# @dishes = {
#       marinara: "£5.50",
#       margherita: "£6.50",
#       pepperoni: "£8",
#       capricciosa: "£10",
#       bufala: "£11"
#     }
