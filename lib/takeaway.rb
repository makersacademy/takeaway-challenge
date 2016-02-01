require_relative 'menu'
require 'twilio-ruby'

class Takeaway

attr_reader :basket, :list_menu, :menu

  def initialize(menu)
    @basket = []
    @menu = menu
    @pizza_menu =
      {'Margherita' => 6,
      'Funghi' => 6,
      'Fiorentina' => 6,
      'Formaggi' => 6,
      'Giardino' => 6,
      'Tropicali' => 7,
      'Reine' => 7,
      'Marino' => 7,
      'Pepporoni' => 7,
      'Carne' => 7,
      }
  end

  def show_menu
    @menu.list_menu
  end

  def place_order(dish, quantity)
    basket << [dish, quantity]
  end

  def total
    total = 0
    basket.each{|dish, quantity| total += (@pizza_menu[dish] * quantity)}
    total
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

  # I want the 'total' argument to be the same number calculated above
  # but don't think this is what is happening
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
