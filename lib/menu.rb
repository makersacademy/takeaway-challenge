class Menu

  attr_reader :order

  def print_menu
    puts " \/\/\/\/\/\/\/\/\/ ".center(30)
    puts "THE MENU OF MASH".center(30)
    puts "()()()()()()()()()()".center(30)
    puts ""
    puts dishes.map{ |dishes, price| "#{dishes} = #{price}".center(30) }
    puts ""
    puts ""
  end


  def dishes
    {
      "Pie n Mash" => 5.25,
      "Bangers n Mash" => 7.25,
      "Eel n Mash" => 3.45,
      "Pizza n Mash" => 6.78,
      "Burger n Mash" => 4.87
    }

  end

  def place_order (food)
    @order = food #attribute
  end


end
