class Order
  def initialize
    @order = {}
  end

  def to_s
    items = ""
    @order.each do |dish, info| 
      items << "#{info[:quantity]} x #{dish} - £#{'%.2f' % (info[:price] * info[:quantity])}\n"
    end
    items << "Total: £#{'%.2f' % total}"
  end

  def add(dish, price, quantity)
    @order[dish][:quantity] += quantity if @order[dish]
    @order[dish] = { price: price, quantity: quantity } unless @order[dish]
  end
  
  private 

  def total
    sum = @order.inject(0) { |sum, (_, info)| sum + (info[:price] * info[:quantity]) }
  end
end
