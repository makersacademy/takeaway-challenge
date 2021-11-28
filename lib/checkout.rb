require 'menu'

class Checkout
  attr_reader :total, :basket, :receipt_list

  def basket(basket = @basket)
    @basket = basket
  end

  def view_basket
    @basket
  end
#   def calculate_total(receipt_list = @receipt_list)
#     @total = receipt_list.inject(0) { |sum, price| sum += price }
#     # send sms
#     @total
#   end

#   def view_basket(basket = @basket )
#     print @basket
#     # puts "Your order:" 
#     # @basket.each do | dish_price |
#     #   dish_price.each do | dish, price |
#     #     puts "#{dish} : £#{price}"
#     #   end
#     # end
#     # puts "your total is £#{@total}"
#   end

# #   def place_order_sms
#       # "Thank you! Your order was placed and will be delivered before (order time + 1 hour))"
# #   end
end
