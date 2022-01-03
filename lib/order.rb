class Order
  def initialize
    @order = {}
  end

  def add(dish, price, quantity)
    @order[dish][:quantity] += quantity if @order[dish]
    @order[dish] = { price: price, quantity: quantity } unless @order[dish]
  end
  
  def to_s
    str = ""
    @order.each do |dish, info| 
      str << "#{info[:quantity]} x #{dish} - £#{'%.2f' % (info[:price] * info[:quantity])}\n"
    end
    str
  end
end
