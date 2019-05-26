require 'twilio-ruby'
# Stores basket containing menu selections
# Tracks cost of 
class Order
  attr_reader :basket
  PAY_ERROR = "Please amend your payment. Incorrect amount tendered."
  
  def initialize(basket = Basket.new, messenger = Messenger.new)
    @messenger = messenger
    @basket = basket
  end
  
  def add_to_basket(menu)
    @basket.add(menu)
  end

  def view
    order_header
    order_details
    order_summary
  end

  def pay(amount)
    tendered = amount.to_s.tr('.', '').to_i
    raise PAY_ERROR if tendered != @basket.total
    send_confirmation
  end
  
  private
  
  def order_header
    puts "ORDER SUMMARY"
    puts "-------------"
  end
  
  def order_details
    basket.itemise
  end
  
  def order_summary
    puts "-------------"
    puts "TOTAL: £#{'%.2f' % (@basket.total / 100.00)}"
  end

  def send_confirmation(phone = ENV['TO_PHONE'])
    @messenger.confirm(phone)
  end
end
