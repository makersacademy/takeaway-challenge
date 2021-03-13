class Dishes

  def list_menu
    dishes.each do |key, value|
      puts "Item: #{key} -----> Price: #{value}"
    end
  end

private

  def dishes
    @menu = { "MexiCali Beef Burger" => 12,
            "The Burrito Burger" => 15,
            "El No Beef Burger" => 15,
            "Los' Tres Bean Burger" => 11,
            "Magic Bean Burger" => 11,
            "Mexican Chik'n Burger" => 15,
            "Stanky Fries" => 7,
            "Nachos Libres" => 9
          }
  end
end
