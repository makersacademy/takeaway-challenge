class Checkout

  def initialize(order, total_price)
    @order = order
    @total_price = total_price
  end

  def order_summery
  end

  def order_summery_pretty
    p "*****'---------------'******"
    p "****'                  '****"
    p "**'                      '**"
    p "*'                        '*"
    p "*        Your Order        *"
    p "*'========================'*"
    p "*     Item     Quantity   . *"
    p "*'========================'*"
    @order.map{|k,v| p ".       #{k}      #{v}        ."}
    p "*'========================'*"
    p "       Order Total: £#{@total_price}      "
    p "*'                        '*"
    p "**'                      '**"
    p "******'---------------'*****"
  end
end
