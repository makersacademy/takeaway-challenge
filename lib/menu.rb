class Menu

attr_reader :menu_list



def initialize
  #@dish = dish
  #@price = price
  @menu_list = menu_list
  #[{ “classic vegan pizza” => 9 }, { “sexy superfood salad” => 7 }, { “comforting vegan sushi” => 12 }, { “awesome mediterranean plate - serves two” => 18 }]
end



  def get_menu
    puts [{ “classic vegan pizza” => 9 }, { “sexy superfood salad” => 7 }, { “comforting vegan sushi” => 12 }, { “awesome mediterranean plate - serves two” => 18 }]
  end


end
