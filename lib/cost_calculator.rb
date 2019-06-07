class Cost_calculator

  attr_reader :total_price

  def price_quantity(order, menu)
    @total_price = 0
    order.each do |index|
        @price_for_1_dish = menu[index["dish"]]
        puts @price_for_1_dish
        @price_for_quantity = @price_for_1_dish * index["quantity"]
        puts @price_for_quantity
        @total_price += @price_for_quantity
        puts @total_price
    end
  end


end
