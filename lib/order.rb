class Order

  def initialize
    @dish_list_with_prices = Menu.new.dish_list_with_prices
    @selected_dishes = []
  end

  #PLEASE READ
  # I initially made a program that selected items, then calculates the cost
  # using the strings instead of arguments. When I got this working,
  # I attempted to use an argument as part of the select_item method
  # in the order rb and the order rspec tests; this didn't work
  # as of this afternoon so I've left it as is.
  # If I uncommented out the above version of select_item and reverted back
  # to how it was, the program would work as intended.

  # def select_item
  #   @temp = []
  #   @selected_dishes = @dish_list_with_prices.select { |k| k == 'Egg Fried Rice' || k == 'Prawn Crackers'}
  #   return @selected_dishes
  # end


  # def select_item(dishes_I_choose)
  #   dishes_I_choose_arr = dishes_I_choose.split(", ")
  #   @selected_dishes = []
  #   dishes_I_choose_arr.each do |dish|
  #     @selected_dishes << @dish_list_with_prices.select { |k| if k == dish then k end}
  #     # @temp << @selected_dishes
  #     # @dish
  #   # return @selected_dishes
  #   end
  # end

  def select_item(dish)
    @selected_dishes << dish
  end

  # def list_selected_dishes
  # end
  # def select_item(dish_I_choose)
  #   @selected_dishes << @dish_list_with_prices.select { |k| k == dish_I_choose }
  # end

  def print_selected_dishes
    dishes_string = @selected_dishes.join(", ")
    return "You have chosen to order: #{dishes_string}"
  end

  def calculate_total_of_selected_dishes
    @total_cost = 0
    @selected_dishes.each do |dish|
      price = @dish_list_with_prices[dish]
      @total_cost += price.to_i
    end
    return "Your order will cost: £#{@total_cost}"
  end

end
