require "./lib/menu"
require "twilio-ruby"

class Takeaway
  attr_accessor :basket, :total
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0.0
    @basket = Hash.new
  end

  def view_menu
    @menu.menu
  end

  def order(dish, quantity = 1)
    raise "No such dish in the menu" unless @menu.menu.include?(dish)
    @basket[dish] = quantity
    confirm_basket(dish, quantity)
    @basket
  end

  def total
    @basket.each { |item, quantity| @total += @menu.menu[item] * quantity }
    @total
  end

  def checkout(amount)
    raise "Incorrect total order value" unless amount == total
    time = (Time.now + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    send_message(message)
  end

  def confirm_basket(dish, quantity)
    print "#{quantity} x #{dish} has been added to your basket."
  end

  def send_message(message)
    account_sid = "AC3bfdee3ab94e7eca1db5323e226f8fb3"
    auth_token = "42deeab9730798ac4a6c3d497a785601"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: message,
      to: "+447949473716",
      from: "+13343784718",
    )
  end
end
