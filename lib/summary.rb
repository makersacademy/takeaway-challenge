class Summary

  def initialize(order)
    @order = order
    @count = 0
  end

  def run
    total
    retro
  end

  private

  def total
    @order.each do |item|
      puts item
      item.each_value do |price|
        @count += price
      end
    end
  end

  def retro
    return "You've ordered #{@order} and it cost £#{@count}"
  end
end
