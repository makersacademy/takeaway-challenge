require 'menu'

class TotalPrice

  attr_reader :list_of_prices
  attr_reader :total_price

  def get_prices_for_order(menu, order)
    @list_of_prices = [3,5]
    # menu.list_of_dishes({ dish: order.dish_to_order}).fetch("price")
    #   # list_of_prices = menu.list_of_dishes.fetch_values(:price)*order.quantity
    # # end
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
