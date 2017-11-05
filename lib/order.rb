# IRB SCRIPT
# irb -r ./lib/order.rb

require_relative 'takeaway'
require_relative 'text'

class Order
  attr_reader :menu, :current, :cost

  def initialize (menu = Takeaway::DISHES)
    @menu = menu
    @current = Hash.new { |h, k| h[k] = 0 }
    @cost = 0
  end

  def add_to_order(dish, quantity)
    fail "That isn't on the menu" unless menu.has_key?(dish.to_sym)
    update_current(dish, quantity)
  end

  def breakdown
    fail no_items if @cost == 0
    order_breakdown
  end

  def pay(amount)
    fail no_items if @cost == 0
    fail "Please pay £#{cost} to complete order" if amount != @cost
    send_message
    print "Thank you! Your order will be delivered before #{Time.now + 3600}"
  end

  private

  def update_current(dish, quantity)
    @current[dish.to_sym] += quantity
    @cost += (menu[dish.to_sym] * quantity)
    puts "#{quantity} #{dish} added to your order"
  end

  def order_breakdown
    @current.each { |k,v| print "#{k} - #{v} x £#{@menu[k]}, " }
    print "Your basket total is £#{@cost}"
  end

  def no_items
    "Nothing added to order yet"
  end

  def send_message
    account_sid = "ACc62846ea6cd0ccef6201d60d5669b8d3" # Your Account SID from www.twilio.com/console
    auth_token = "38063e6515b226eed2ab0e7b94482534"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order will be delivered before #{Time.now + 3600}",
        to: "+447780869533",    # Replace with your phone number
        from: "+441325952438")  # Replace with your Twilio number
  end
end
