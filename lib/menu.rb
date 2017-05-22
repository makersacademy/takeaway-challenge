class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
       1 => { dish: :Pizza, price: 8.50 },
       2 => { dish: :Pasta, price: 9.20 },
       3 => { dish: :Burger, price: 8.00 },
       4 => { dish: :Chicken, price: 10.50 },
       5 => { dish: :Sandwich, price: 6.70 },
       6 => { dish: :Salad, price: 5.40 },
       7 => { dish: :Chips, price: 2.80 },
       8 => { dish: :Milkshake, price: 2.20 },
       9 => { dish: :Juice, price: 1.70 },
       10 => { dish: :Sundae, price: 2.50 },
       11 => { dish: :Cake, price: 3.00 }
    }
  end

end
