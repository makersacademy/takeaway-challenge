class Order

  def initialize
    @dish_list_with_prices = Menu.new.dish_list_with_prices
    @selected_dishes = []
  end

  def select_item(dish)
    @selected_dishes << dish
  end

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
