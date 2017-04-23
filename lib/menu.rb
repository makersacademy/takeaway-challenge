class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Pizza" => 5.48, "Lamb Donner Kebab" => 7.30, "Chicken Wings" => 7.63, "Garlic Bread" => 3.40 }
  end
end
