class OrderListCalculator

  def self.calculate(orderlist)
    total = 0
      orderlist.contents.each do |order|
        total += order.price
      end
    [orderlist.length, total]
  end

end
