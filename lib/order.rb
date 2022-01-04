class Order
  def initialize
    @order = {}
  end

  def to_s
    basket = "\n#{"Your Basket of Burrito Goodness".rjust(40)}\n"
    @order.each do |dish, info| 
      basket << "\n#{"#{dish} x #{info[:quantity]}     " \
      "£#{'%.2f' % (info[:price] * info[:quantity])}".rjust(40)}"
    end
    basket << "\n\n#{"Total:    £#{'%.2f' % total}".rjust(40)}"
  end

  def add(dish, price, quantity)
    @order[dish][:quantity] += quantity if @order[dish]
    @order[dish] = { price: price, quantity: quantity } unless @order[dish]
  end

  def remove(dish, quantity)
    @order[dish][:quantity] -= quantity if @order[dish]
    @order.delete("dish") if @order[dish][:quantity] <= 0
  end
  
  private 

  def total
    sum = @order.inject(0) { |sum, (_, info)| sum + (info[:price] * info[:quantity]) }
  end
end
