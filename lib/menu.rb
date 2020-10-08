class Menu
  attr_reader :items

  def initialize
    @items = {
      "Blini" => 7,
      "Chicken Kiev" => 15,
      "Shuba" => 11,
      "Bortsch" => 8
    }
  end
  
end
