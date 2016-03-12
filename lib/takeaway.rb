class TakeAway

  attr_reader :basket, :total, :menu

  def menu
    @menu = {
        "Bratwurst in a bun" => 2.49,
        "Bockwurst in a bun" => 2.49,
        "Käsekrainer in a bun" => 2.79,
        "Veggie sausage in a bun" => 2.29,
        "Sauerkraut" => 1.19,
        "Crispy onions" => 0.29,
        "Mustard" => 0.29,
        "Ketchup" => 0.29,
        "Sidesalad" => 0.75
      }

      puts menu
  end

  def order(dish)

  end



end
