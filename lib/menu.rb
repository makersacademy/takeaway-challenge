class Menu
attr_reader :dishes

  def initialize
    @dishes = {}
    menu
  end

  def menu
    @dishes = {"Chow Mein" => 5.50, "Sweet & Sour Chicken" => 5.85,
       "Aromatic Duck" => 7.95, "Crispy Beef" => 5.95}
  end
end
