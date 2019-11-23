require_relative "menu"

class Order
  
  attr_reader :order

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @menu = ""
    @order = []
  end

  def see_menu
    @menu = @menu_class.new
    @menu.check_menu
  end

  def add(dish)
    @order << dish
    "You now have #{@order.count(dish)} of the #{dish} meal in your order"
  end

  def check_total
    total = 0
    @order.each { |dish|
      puts "#{dish} - £#{Menu.new.get_price(dish)}" 
      total += Menu.new.get_price(dish)
    }
    puts "-" * 15
    puts "Total - £#{total}"
  end

  def place_order
    time = Time.new
    hour = (time.strftime("%k").to_i + 1).to_s
    require 'twilio-ruby'
    account_sid = 'AC5a0933cfcc02ee13790862a55c60c227'
    auth_token = '91ed50115a18fc0f11833580dd81b468'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+44 7481 339235' # Your Twilio number
    to = '+44 7816 449949' # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered by #{hour}:#{time.strftime("%M")}"
    )
  end
end
