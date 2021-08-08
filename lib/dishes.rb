class Dishes

  attr_reader :dishes
  def initialize
    @dishes = { "Samosa" => 1.70, "Seekh Kebab" => 1.80, "Chicken Tikka" => 4.99,
       "Lamb Tikka" => 4.99, "Onion Bhaji" => 1.50 }
  end
end
