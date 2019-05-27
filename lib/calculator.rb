class Calculator
  attr_reader :total_price

  def initialize
    @total_price = 0
  end

  def total(summarised_order)
    summarised_order.each { |food_item, quantity|
      @total_price += (food_item.price * quantity)
    }
    @total_price
  end
end
