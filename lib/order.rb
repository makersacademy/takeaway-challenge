# require 'rubygems'
# require 'twilio-ruby'

# contains a list of items and quantity
class Order
  
  account_sid = 'TWILIO_ACCOUNT_SID'
  auth_token = 'TWILIO_AUTH_TOKEN'
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  attr_reader :basket
  PAY_ERROR = "Please amend your payment total. Amount due: #{@total}"

  def initialize(basket = Basket)
    @basket = basket.new
  end

  def confirm_basket(menu)
    @basket.add(menu)
  end

  def view
    order_header
    order_details
    order_summary
  end

  def pay(amount = @total)
    raise PAY_ERROR if amount != @total

    message = @client.messages
      .create(
        body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1}",
        from: '+441484599374',
        to: '+4407976237519'
      )
      puts message.sid

  end
  
  private
  
  def order_details
    @total = 0
    @basket.contents.each { |item|
      puts "#{item[:qty]} x #{item[:name]} @ £#{'%.2f' % (item[:unit_cost] / 100.00)} : £#{'%.2f' % (item[:price] / 100.00)}"
      @total += item[:price]
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

end
