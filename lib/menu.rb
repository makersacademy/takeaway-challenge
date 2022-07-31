class Menu
  attr_reader :drinks, :food, :desert
    
  def initialize
    @food = { "Margharita" => 8.99,
    "Hawian" => 9.99,
    "Peperoni" => 9.99
    }
  end

end
