class Restaurant

attr_reader :menu

  def menu
    @menu = {1 => ['Margarita:', 5.00], 2 => ['Meat_Feast:', 6.00], 3 => ['Hawaiin:', 5.50],
            4 => ['BBQ_Chicken:', 6.00], 5 => ['Vegetarian:', 5.50], 6 => ['Full_Monty:', 8.00],
            7 => ['Ham_and_Cheese:', 4.00], 8 => ['Pepperoni:', 5.50], 9 => ['Chips:', 3.00]}
  end

  def see_menu
    puts "1: #{menu[1][0]} => £#{menu[1][1]}}"
    puts "2: #{menu[2][0]} => £#{menu[2][1]}}"
    puts "3: #{menu[3][0]} => £#{menu[3][1]}}"
    puts "4: #{menu[4][0]} => £#{menu[4][1]}}"
    puts "5: #{menu[5][0]} => £#{menu[5][1]}}"
    puts "6: #{menu[6][0]} => £#{menu[6][1]}}"
    puts "7: #{menu[7][0]} => £#{menu[7][1]}}"
    puts "8: #{menu[8][0]} => £#{menu[8][1]}}"
    puts "9: #{menu[9][0]} => £#{menu[9][1]}}"
  end


end
