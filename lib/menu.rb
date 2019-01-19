class Menu

  attr_reader :menu
    
  def initialize(menu = {:pizza => 3, :chips => 6, :curry => 7, :cake => 6})
   @menu = menu
  end
  
  def display
    p @menu
  end
end
