require 'menu'

class Checkout
  attr_reader :total, :basket, :receipt_list

  def initialize(basket = @basket, receipt_list = @receipt_list )
    @basket = basket
    @receipt_list = receipt_list
  end

  def view_basket#(basket = @basket)
    print @basket
  end
  
  def calculate_total#(receipt_list = @receipt_list)
    @total = @receipt_list.inject(0) { |sum, price| sum += price }
  end

  def send_sms
  
  end

  # def place_order
  #   print @total
  #   print view_basket
  #   send_sms
  # end
end
