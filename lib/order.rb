module Order


  def order_input(menu)
  dish_array = []
  quantity_array = []
  return_array = []
  x = 1
  while x == 1
    y = 1
    while y == 1
      puts "Enter the name of the dish. (Enter q to quit)"
      dish = gets.chomp.to_sym
      fail "User has cancelled order" if dish == :q
      if menu.has_key?(dish)
        y = 2
        dish_array << dish
      else
        "Sorry, did not recognise that dish."
      end
    end
    z = 1
    while z == 1
      puts "Enter the quantity you require. (Enter q to quit)"
      quantity = gets.chomp
      fail "User has cancelled order" if quantity == "q"
      puts "You entered #{quantity.to_i}, is that correct? Enter y to continue with your order"
        if gets.chomp.downcase == "y"
          puts "Order completed"
          quantity_array << quantity.to_i
          z = 2
        else
          "Please try again."
        end
      end
    puts "If you wish to finish ordering press y; press any other key to place another order."
    if gets.chomp.downcase == "y"
      x = 2
    end
  end
  return_array << dish_array << quantity_array
  end
end
