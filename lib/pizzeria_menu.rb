class PizzeriaMenu
  def initialize
    @dishes = [{ name: "Margherita", price: 7.5 },
              { name: "Bufala", price: 8 },
              { name: "Anchovy", price: 8 },
              { name: "Pepperoni", price: 8.5 },
              { name: "Calabria", price: 8.5 },
              { name: "Quattro Formaggi", price: 10 },
              { name: "Truffle", price: 12.5 },
              { name: "Gold Pizza", price: 1200 }
    ]
    @title = "* * * PAPA'S * PIZZERIA * * *\n"
  end

  def list_dishes
    @title + formatted_list.join
  end

  private

  def formatted_list
    @dishes.map.with_index do |dish, index|
      "#{index + 1}) #{dish[:name]}: £#{sprintf('%.2f', dish[:price])}\n"
    end
  end
end
