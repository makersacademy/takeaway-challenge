require_relative 'menu'
require 'twilio-ruby'

class Takeaway

attr_reader :basket, :list_menu, :menu

  def initialize(menu_klass = Menu)
    @basket = []
    @menu_klass = menu_klass
  end

  def show_menu
    @menu = @menu_klass.new
    @menu.list_menu
  end

  def place_order(dish, quantity)
    basket << [dish, quantity]
  end

  # Here, I want to access my 'pizza_menu' hash and return the value (price)
  # for the associated key (pizza name) BUT not working

  def total
    total = 0
    basket.each{|arr| total += @menu.pizza_menu[arr[0]] * arr[1]}
    total
  end

  # I want the 'total' argument to be the same number calculated above
  # but don't think this is what is happening
  def order_processed(total)
    send_text("Thanks for your order, total cost: #{total}")
  end

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
