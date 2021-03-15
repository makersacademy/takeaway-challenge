class Order
  attr_reader :whole_order, :total
  def initialize
    @whole_order = []
    @total = []
    @dishes = Dishes.new
  end

  def select_dishes
    puts "Enter item off menu, when done type end order"
    until @order == "end order"
      @order = gets.chomp
      push_order_and_total_to_array
    end
    return @whole_order
  end

  def summarised_bill
    @whole_order.each do |line|
      puts "#{line}".center(50)
    end
    puts "------------".center(50)
    puts "#{@total.sum}".center(50)
  end

private

  def push_order_and_total_to_array
    list_of_dishes = @dishes.dishes
    list_of_dishes.each do |key, value|
      if @order == key
        @whole_order << "#{key} ---> #{value}"
        @total << value
      end
    end
  end
end
