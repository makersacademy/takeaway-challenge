class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "Vegan curry" => 13,
                "Veggie burger" => 9,
                "Chips" => 5,
                "Avacado on toast" => 9, 
                "Mac n cheese" => 10,
                "Halloumi burger" => 12 }
  end
end