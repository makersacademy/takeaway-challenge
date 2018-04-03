class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Sesame Prawn Toast" => 4.00, "Crispy Seaweed" => 3.80,
      "Chilli Squid" => 4.90, "Vegetable Spring Rolls(4)" => 2.40,
      "Prawn Crackers" => 1.50, "Crispy Duck with Pancakes" => 7.80,
      "Wonton Soup" => 3.30, "Sweet & Sour Chicken" => 4.50,
      "Special Fried Rice" => 4.30, "Chicken Chow Mein" => 4.40,
      "Cantonese Style Roast Duck" => 6.00 }
  end
end
