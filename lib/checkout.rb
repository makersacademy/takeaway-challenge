module Checkout
  def order_price
  	order_total = order_list.map { |x| x.values }.flatten(1).inject(:+)
    order_total.round(2)
  end
end