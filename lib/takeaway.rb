require_relative 'menu'
require 'twilio-ruby'

class Takeaway

attr_reader :basket, :confirmation

  def initialize(client_klass = Twilio::REST::Client)
    @basket = []
    @menu = Menu.new
    @twilio_class = client_klass
  end

  def show_menu
    @menu.pizza_menu
  end

  def place_order(dish, quantity)
    basket << [dish, quantity]
  end

  def calculate_total
    total = 0
    basket.each{|dish, quantity| total += (@menu.pizza_menu[dish] * quantity)}
    total
  end

  def check_total
    puts "total to pay = £#{calculate_total} is that correct?"
    confirmation = gets.chomp
    if confirmation == 'yes'
      send_text
    else
      puts 'your order has been cancelled'
    end
  end

private
  def send_text
    account_sid = "AC89049925001592fc5bb621c43e634ad0"
    auth_token = "1c13f849228d661eb6aa2f0141f6d34c"

    @client = @twilio_class.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447772043288",
      from: "+441315103547",
      body: "Thanks for your order, total cost: £#{calculate_total}"
    )
  end

end
