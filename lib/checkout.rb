require 'menu'

class Checkout
  attr_reader :total, :basket, :receipt_list

  def view_basket(basket = @basket)
    @basket = basket
  end
  
  def calculate_total(receipt_list = @receipt_list)
    @receipt_list = receipt_list
    @total = @receipt_list.inject(0) { |sum, price| sum += price }
    # send sms
    #@total
  end
end
