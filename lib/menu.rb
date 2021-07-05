class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "vegan curry" => 13,
                "veggie burger" => 9,
                "chips" => 5,
                "avacado on toast" => 9, 
                "mac n cheese" => 10,
                "halloumi burger" => 12 }
  end

  def see_dishes
    p @dishes
  end
end
