class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Hoummos" => "4.50", "Tabbouleh" => "4.50", "Moussakah" => "4.50", "Soujok" => "5.25", "Batata Harra" => "4.75",
      "Falafel" => "3.75", "Halloumi" => "4.25", "Calamari" => "6.25", "Lamb Kibbeh" => "5.25", "Cheese Rekakat" => "4.75",
      "Lamb Skewers" => "11.25", "Lamb Kafta" => "10.50", "Mixed Grill" => "13.95", "Mixed Shawarma" => "10.75",
      "Chicken Shawarma" => "10.50", "King Prawns" => "14.50", "Aubergine Stew" => "8.95", "Okra Stew" => "8.95", 
      "Baklawa" => "3.50", "Chocolate Cake" => "3.00", "Ice Cream" => "3.00", "Orange Juice" => "3.50", "Apple Juice" => "3.50"
    }
  end

  def see_menu
  end

end
