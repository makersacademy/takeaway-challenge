require_relative 'menu'
require 'twilio-ruby'

class Takeaway

attr_reader :basket

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def show_menu
    @menu.pizza_menu
  end

  def place_order(dish, quantity)
    basket << [dish, quantity]
  end

  def total
    @total = 0
    basket.each{|dish, quantity| @total += (@menu.pizza_menu[dish] * quantity)}
    @total
  end

  def check_total
    puts "total to pay = £#{total} is that correct?"
    confirmation = gets.chomp
    if confirmation == 'yes'
      send_text
    else
      puts 'your order has been cancelled'
    end
  end

  def order_processed(total)
    send_text("Thanks for your order, total cost: #{total}")
  end

#NOTE: This should be made private
  def send_text
    account_sid = "AC89049925001592fc5bb621c43e634ad0"
    auth_token = "1c13f849228d661eb6aa2f0141f6d34c"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447772043288",
      from: "+441315103547",
      body: "Thanks for your order, total cost: £#{total}"
    )
  end

end
