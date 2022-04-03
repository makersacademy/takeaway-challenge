class Menu
  attr_reader :lists_dishes

  def initialize
    @list_hash = {}
  end

  def lists_dishes
    @List_hash = 
        { "Cod" => 11.0, 
          "Rock" => 13.0, 
          "Haddock" => 13.0, 
          "Plaice" => 13.0,
          "Skate" => 18.0,
          "Code Roe" => 3.60,
          "Fish Cake" => 3.0,
          "Chips" => 3.80,
          "chip Roll" => 4.50,   
        }
  end 
end