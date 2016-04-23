class Menu
  attr_reader :menu

  def initialize
    @menu = {:king_burger => 8, :cheese_burger => 7, :chicken_burger => 7 }
  end

  def read
   puts @menu.dup
  end

end
