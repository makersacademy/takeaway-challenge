
class TotalPrice

  attr_reader :list_of_prices
  attr_reader :total_price

  def get_prices_for_order(menu, order)
    @list_of_prices = [3,5]
    #iterate over each hash in the array
    #does the dish equal the dish
    #if so, get the price

    @dish_ordered = menu.list_of_dishes.select do |dish|
      dish[:dish] == order.dish_to_order
    end
    p @dish_ordered[0][:price]
    p @dish_ordered
    p @price_of_item = @dish_ordered[0][:price] * order.quantity


    # [dish:] order.dish_to_order}).fetch("price")
    #   list_of_prices = menu.list_of_dishes.fetch_values(:price)*order.quantity
    # end
  end


  def calculate_total_price
    sum = 0
    @total_price = @list_of_prices.each { |price| sum+=price }
    8
  end

  def print_total_price
    puts "Total Price: £#{total_price}"
  end

end
