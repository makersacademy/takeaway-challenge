class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "pizza" => 1, "pasta" => 2 }
  end

  def display_menu
    @dishes 
end

end 

