class PizzeriaMenu
  def initialize
    @dishes = [{ "Margherita" => 7.5 },
              { "Bufala" => 8 },
              { "Anchovy" => 8 },
              { "Pepperoni" => 8.5 },
              { "Calabria" => 8.5 },
              { "Quattro Formaggio" => 10 },
              { "Truffle" => 12.5 },
              { "Gold Pizza" => 1200 }
    ]
    @title = "* * * PAPA'S * PIZZERIA * * *\n"
  end

  def list_dishes
    puts @title + formatted_list.join
  end

  def dishes
    @dishes.dup
  end

  private

  def formatted_list
    @dishes.map.with_index do |dish, index|
      dish.map do |name, price|
        "#{index + 1}) #{name}: £#{sprintf('%.2f', price)}\n"
      end
    end
  end
end
