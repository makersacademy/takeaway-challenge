class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      'Cockroach Clusters' => 4.99,
      'Maggoty Haggis' => 3.99,
      'Rock Cakes' => 6.99,
      'Stoat Sandwiches' => 4.50,
      'Chocolate Frogs' => 3.79,
      'Pumpkin Pasties' => 3.60,
      'Bouillabaisse' => 13.40,
    }
  end

end
