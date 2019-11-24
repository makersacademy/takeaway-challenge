class Menu
  attr_reader :list_of_dishes
  
  def initialize 
    @list_of_dishes = {
      "Fish" => "3£",
      "Chicken" => "2£",
      "Pasta" => "4£",
      "Bread" => "1£"
    }
  end
  
  def show_menu
    puts @list_of_dishes.dup
  end
  
end