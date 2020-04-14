require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :cost

  def initialize
    @menu = { Chicken: 5, 
              Steak: 8,
              Fish: 6,
              Sides: 4
            }
  end

  def show_menu
    puts "What would you like to eat? Please type your order"
    @menu.each { |k, v|
      p "#{k} = £#{v}" 
    }
  end

  def place_order(order)
    @cost = 0
    order.foods.each { |food|
      @cost += @menu[food.to_sym]
    }
    send_message(order.phone_number)
  end

  def send_message(phone)
    account_sid = ENV["TWILIO_ACCOUNT_SID"] # Your Twilio account sid
    auth_token = ENV["TWILIO_AUTH_TOKEN"] # Your Twilio authentication token
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: ENV["TWILIO_NUMBER"], # Your Twilio number
      to: "#{phone}", # Your mobile phone number
      body: "Thank you! Your order will cost £#{@cost} " +
            "and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}"
    )
  end

end
