class Menu

attr_reader :menu_list

  def initialize
    @menu_list = { "pizza" => 4.50,
                   "pasta" => 6.00,
                   "cake" => 4.00,
                   "coffee" => 2.50
                 }
  end


  
end
