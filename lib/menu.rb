class Menu

  attr_reader :dishes

  def list
    # All prices are in pounds
    dishes = { "Dal Tadka" => 4.50,
                "Saag Paneer" => 5.50,
                "Vegetable Curry" => 6.50,
                "Chickpeas Curry" => 4.00,
                "Naan" => 2.00,
                "Rice" => 3.00
    }
  end
end
