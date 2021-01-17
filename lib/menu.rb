class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "Buffalo chicken burger" => 12,
                "Angus beef burger" => 14,
                "Plantastic burger" => 8,
                "Chips" => 3,
                "Shoestring fries" => 3,
                "Coke" => 2 }
  end
end
