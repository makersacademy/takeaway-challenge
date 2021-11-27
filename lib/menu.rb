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
    @dishes.each do |dish|
      puts "#{dish[:dish]} #{dish[:price]}"
    end
  end

  def select_dish(name, quantity)
    @dishes.each do |dish| 
      if dish[:dish] == name
        choice = dish.dup
        choice[:quantity] = quantity
        return choice
      end
    end
  end

end

# def select_dish(name, quantity)
  # @dishes.each { |dish| 
  #   if dish[:dish] == name
  #     choice = dish.dup
  #     choice[:quantity] = quantity
  #     choice
  #  }
#   { dish: name, price: @dishes[name], n: number }
# end

# @dishes = {
#       marinara: "£5.50",
#       margherita: "£6.50",
#       pepperoni: "£8",
#       capricciosa: "£10",
#       bufala: "£11"
#     }

# def add_to_cart(name, number)
#   @menu.select_dish(name, number)
# end