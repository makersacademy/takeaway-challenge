require 'twilio-ruby'

class Order

  attr_reader :selection
  attr_reader :menu

  def initialize menu
    @selection = {}
    @menu = menu
  end

  def add_item dish, quantity
    if !on_menu? dish
      return "That item is not on the menu"
    else
      selection.store dish, quantity
    end
  end

  def on_menu? dish
    menu.dishes.include? dish
  end

  def place_order amount
    if correct_amount? amount
      send_sms
      return "Thankyou! Your order was successfully placed and will be delivered within 1 hour."
    else
      return "Order unsuccessful. Total should equal #{build_order[selection]}"
    end
  end

  def correct_amount? amount
    amount == build_order[selection]
  end

  def build_order
    total = 0 
    selection.each do |item, quantity| 
      total += quantity * menu.dishes[item]
    end
    {selection => total}
  end

  private

  def send_sms
    print "What is your mobile number?\n"
    customer_number = gets.chomp

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441768392015', 
      to: "#{customer_number}", 
      body: 'Thankyou! Your order was successfully placed and will be delivered within 1 hour.')
    
    puts "SMS order confirmation successfully sent"
  end

end