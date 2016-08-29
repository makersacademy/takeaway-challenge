class Menu
attr_reader :dishes

  def initialize
    @dishes = {}
    menu
  end

  def menu
    @dishes = {"Chow Mein" => 5.55, "Sweet & Sour Chicken" => 5.85,
       "Aromatic Duck" => 7.95, "Crispy Beef" => 5.95}
       #{:dish => "Chow Mein", :price => 5.50, :dish => "Sweet & Sour Chicken", :price => 5.85, :dish => "Aromatic Duck", :price => 7.95, :dish => "Crispy Beef", :price => 5.95}
  end
end
