class Cost_calculator

  attr_reader :total_price

  def initialize
      @total_price = 0
  end


  def calculate(order, menu)
    order.each do |index|
        @price_for_1_dish = menu[index["dish"]]
       @price_for_quantity = @price_for_1_dish * index["quantity"]
        @total_price += @price_for_quantity
    end
  end


end
