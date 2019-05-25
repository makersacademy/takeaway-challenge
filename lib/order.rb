require 'twilio-ruby'
# contains a list of items and quantity
class Order
  attr_reader :basket, :total
  PAY_ERROR = "Please amend your payment total. Amount due: #{@total}"

  def initialize(basket = Basket.new, messenger = Messenger.new)
    @messenger = messenger
    @basket = basket
    @total = 0
  end
  
  def confirm_basket(menu)
    @basket.add(menu)
    @basket.contents.each { |dish|
    @total += dish[:price]
    }
  end

  def view
    order_header
    order_details
    order_summary
  end

  def pay(amount = @total)
    raise PAY_ERROR if amount != @total
    # send_confirmation COMMENTED OUT TO AVOID SMS SENDS 
  end
  
  private
  
  def order_details
    @basket.contents.each { |item|
      puts "#{item[:qty]} x #{item[:name]} @ £#{'%.2f' % (item[:unit_cost] / 100.00)} : £#{'%.2f' % (item[:price] / 100.00)}"
    }
  end
  
  def order_header
    puts "ORDER SUMMARY"
    puts "-------------"
  end
  
  def order_summary
    puts "-------------"
    puts "TOTAL: £#{'%.2f' % (@total / 100.00)}"
  end

  def send_confirmation(phone = ENV['TO_PHONE'])
    @messenger.confirm(phone)
  end
end
