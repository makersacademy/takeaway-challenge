require_relative 'menu'

class Checkout
  attr_reader :total, :basket, :receipt_list, :sms

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
    @sms = "Thank you ! your order was place and will be delivered at #{(Time.now + 1*60*60).strftime("%k:%M %p")}"
  end

  def place_order
    print @total
    view_basket
    send_sms
  end
end
