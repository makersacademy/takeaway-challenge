class Order

  def initialize
    @dish_list_with_prices = {'Egg Fried Rice' => '3', 'Prawn Crackers' => '2', 'Sweet and Sour Chicken' => '5'}
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


  def select_item(dishes_I_choose)
    dishes_I_choose_arr = dishes_I_choose.split(", ")
    p dishes_I_choose_arr
    dishes_I_choose_arr.each do
      @selected_dishes = @dish_list_with_prices.select { |k| k == dishes_I_choose}
      p @selected_dishes
    # return @selected_dishes
    end
  end

  def print_selected_dishes
    @temp = []
    @selected_dishes.each do |k, v|
      @food_name = "#{k}"
      @temp << @food_name
    end
    x = @temp.join(", ")
    return "You have chosen to order: #{x}"
  end

  def calculate_total_of_selected_dishes
    @total_cost = 0
    @selected_dishes.each do |k, v|
      @total_cost += v.to_i
    end
    return "Your order will cost: £#{@total_cost}"
  end

end
