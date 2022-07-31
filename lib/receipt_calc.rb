class ReceiptCalc

  attr_reader :cost

  def initialize(ordered_items)
    @order = ordered_items
    @cost = 0
  end

  def generate_receipt
    @order.each do |dish_ordered|
      @cost += dish_ordered[:price]
      puts "#{dish_ordered[:name].capitalize} - #{dish_ordered[:price]}\n"
    end
    puts "The cost is £#{@cost}."
  end
end
