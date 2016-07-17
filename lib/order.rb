class Order

  START_TOTAL = 0
  attr_reader :items, :total

  def initialize
    @items = Hash.new(0)
    @total = START_TOTAL
  end

  def add(item, price, quantity)
    @items[item] += quantity
    @total += (price * quantity)
  end

  def check_total(customer_total)
    customer_total == @total ? right_total_message : wrong_total_message
  end


private

  def right_total_message
    "£#{@total}0 is the correct total"
  end

  def wrong_total_message
    "Wrong total: I have £#{@total}0"
  end



end
