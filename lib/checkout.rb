class Checkout

  def initialize(order, total_price)
    @order = order
    @total_price = total_price
  end

  def order_summery
    p "Your Order"
    p "Item     Quantity"
    @order.map{|k,v| p "#{k}       #{v}"}
    puts
    p "Order Total: £#{@total_price}"
    p "#{@total_price}"
    puts
    p "confirm your order to continue, or add and subtract to your order until you're happy :)!"
  end
end
